resource "fivetran_connector_schema_config" "schema" {
  connector_id           = "junk_trembling"
  schema_change_handling = "BLOCK_ALL"
  schemas = {
    "github_arees_terraform" = {
      "enabled" = true
      "tables" = {
        "branch_commit_relation" = {
          "enabled" = true
          "columns" = {
            "branchName" = {
              "enabled" = true
            }
            "commitSha" = {
              "enabled" = true
            }
          }
        }
        "commit" = {
          "enabled" = true
          "columns" = {
            "authorEmail" = {
              "enabled" = true
            }
            "authorDate" = {
              "enabled" = false
            }
            "authorName" = {
              "enabled" = true
            }
            "repositoryId" = {
              "enabled" = true
            }
            "committerDate" = {
              "enabled" = true
            }
            "committerName" = {
              "enabled" = true
            }
            "message" = {
              "enabled" = true
            }
            "committerEmail" = {
              "enabled" = true
            }
            "sha" = {
              "enabled" = true
            }
          }
        }
        "commit_file" = {
          "enabled" = true
          "columns" = {
            "filename" = {
              "enabled" = true
            }
            "additions" = {
              "enabled" = true
            }
            "deletions" = {
              "enabled" = true
            }
            "changes" = {
              "enabled" = true
            }
            "commitSha" = {
              "enabled" = true
            }
            "status" = {
              "enabled" = true
            }
          }
        }
        "commit_parent" = {
          "enabled" = true
          "columns" = {
            "commit_sha" = {
              "enabled" = true
            }
            "parent_sha" = {
              "enabled" = true
            }
          }
        }
        "commit_pull_request" = {
          "enabled" = true
          "columns" = {
            "commitSha" = {
              "enabled" = true
            }
            "pullRequestId" = {
              "enabled" = true
            }
          }
        }
        "issue" = {
          "enabled" = true
        }
        "issue_assignee" = {
          "enabled" = true
        }
        "issue_assignee_history" = {
          "enabled" = true
        }
        "issue_closed_history" = {
          "enabled" = true
        }
        "issue_comment" = {
          "enabled" = true
        }
        "issue_label" = {
          "enabled" = true
        }
        "issue_label_history" = {
          "enabled" = true
        }
        "issue_locked_history" = {
          "enabled" = true
        }
        "issue_mention" = {
          "enabled" = true
        }
        "issue_merged" = {
          "enabled" = true
        }
        "issue_milestone_history" = {
          "enabled" = true
        }
        "issue_referenced" = {
          "enabled" = true
        }
        "issue_renamed" = {
          "enabled" = true
        }
        "label" = {
          "enabled" = true
        }
        "milestone" = {
          "enabled" = true
        }
        "pull_request" = {
          "enabled" = true
        }
        "pull_request_ready_for_review_history" = {
          "enabled" = true
        }
        "pull_request_review" = {
          "enabled" = true
        }
        "pull_request_review_comments" = {
          "enabled" = true
        }
        "pull_request_review_dismissed" = {
          "enabled" = true
        }
        "repository" = {
          "enabled" = true
          "columns" = {
            "private" = {
              "enabled" = true
            }
            "created_at" = {
              "enabled" = true
            }
            "description" = {
              "enabled" = true
            }
            "language" = {
              "enabled" = true
            }
            "ownerId" = {
              "enabled" = true
            }
            "archived" = {
              "enabled" = true
            }
            "fork" = {
              "enabled" = true
            }
            "full_name" = {
              "enabled" = true
            }
            "name" = {
              "enabled" = true
            }
            "default_branch" = {
              "enabled" = true
            }
            "id" = {
              "enabled" = true
            }
            "watchers_count" = {
              "enabled" = true
            }
            "forks_count" = {
              "enabled" = true
            }
            "homepage" = {
              "enabled" = true
            }
          }
        }
        "requested_reviewer_history" = {
          "enabled" = true
        }
        "stargazer" = {
          "enabled" = true
        }
        "team" = {
          "enabled" = true
        }
        "user" = {
          "enabled" = true
          "columns" = {
            "hireable" = {
              "enabled" = true
            }
            "updated_at" = {
              "enabled" = true
            }
            "name" = {
              "enabled" = true
            }
            "site_admin" = {
              "enabled" = true
            }
            "bio" = {
              "enabled" = true
            }
            "created_at" = {
              "enabled" = true
            }
            "company" = {
              "enabled" = true
            }
            "location" = {
              "enabled" = true
            }
            "id" = {
              "enabled" = true
            }
            "blog" = {
              "enabled" = true
            }
            "login" = {
              "enabled" = true
            }
            "type" = {
              "enabled" = true
            }
          }
        }
        "user_email" = {
          "enabled" = true
          "columns" = {
            "name" = {
              "enabled" = true
            }
            "userId" = {
              "enabled" = true
            }
            "email" = {
              "enabled" = true
            }
          }
        }
      }
    }
  }
}
