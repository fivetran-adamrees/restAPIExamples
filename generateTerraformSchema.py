import requests

API_KEY = 'API_KEY'
API_SECRET = 'API_SECRET'
BASE_URL = 'https://api.fivetran.com/v1'
CONNECTOR_ID = 'junk_trembling'
OUTPUT_FILE = 'fivetran_schema_config.tf'

# Step 1: Get schemas
schema_url = f"{BASE_URL}/connectors/{CONNECTOR_ID}/schemas"
response = requests.get(schema_url, auth=(API_KEY, API_SECRET))
response.raise_for_status()
data = response.json().get("data", {})

schema_change_handling = data.get("schema_change_handling", "ALLOW_ALL")
schemas_data = data.get("schemas", {})

terraform_schema = {}

for schema_name, schema_info in schemas_data.items():
    tables = schema_info.get("tables", {})
    schema_block = {"enabled": True, "tables": {}}

    for table_name, table_info in tables.items():
        if not table_info.get("enabled"):
            continue

        # Get column config
        col_url = f"{BASE_URL}/connectors/{CONNECTOR_ID}/schemas/{schema_name}/tables/{table_name}/columns"
        col_response = requests.get(col_url, auth=(API_KEY, API_SECRET))
        col_response.raise_for_status()
        columns_data = col_response.json().get("data", {}).get("columns", {})

        column_block = {
            col_name: {"enabled": bool(col_info.get("enabled", False))}
            for col_name, col_info in columns_data.items()
        }

        # Build table block
        table_block = {"enabled": True}
        if column_block:
            table_block["columns"] = column_block

        schema_block["tables"][table_name] = table_block

    terraform_schema[schema_name] = schema_block

# Function to render nested dict in Terraform-style HCL format
def render_hcl(d, indent=0):
    lines = []
    indent_str = "  " * indent
    if isinstance(d, dict):
        lines.append("{")
        for key, value in d.items():
            key_str = f'"{key}"'
            if isinstance(value, dict):
                lines.append(f'{indent_str}  {key_str} = {render_hcl(value, indent + 1)}')
            else:
                val_str = "true" if value is True else "false" if value is False else f'"{value}"'
                lines.append(f'{indent_str}  {key_str} = {val_str}')
        lines.append(f"{indent_str}}}")
    return "\n".join(lines)

# Write full Terraform resource block
with open(OUTPUT_FILE, "w") as f:
    f.write(f'resource "fivetran_connector_schema_config" "schema" {{\n')
    f.write(f'  connector_id           = "{CONNECTOR_ID}"\n')
    f.write(f'  schema_change_handling = "{schema_change_handling}"\n')
    f.write(f'  schemas = {render_hcl(terraform_schema, indent=1)}\n')
    f.write("}\n")

print(f"\n✅ Terraform schema config written to: {OUTPUT_FILE}")
