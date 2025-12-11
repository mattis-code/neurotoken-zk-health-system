#!/bin/bash

echo "🚀 SCRIPT 22 — Creating GitHub Projects Roadmap Board …"

############################################
# 1. CREATE PROJECT VIA GRAPHQL
############################################

PROJECT_ID=$(gh api graphql -f query='
mutation {
  createProjectV2(input: {ownerId: "MDQ6VXNlcjE1NzM2MDg2", title: "NeuroToken Roadmap 2026–2029"}) {
    projectV2 {
      id
    }
  }
}' --jq '.data.createProjectV2.projectV2.id')

echo "📌 Project created: $PROJECT_ID"

############################################
# 2. CREATE FIELDS (STATUS COLUMN)
############################################

STATUS_FIELD_ID=$(gh api graphql -f query='
mutation($project:ID!) {
  createProjectV2Field(
    input: {
      projectId:$project,
      name:"Status",
      dataType: SINGLE_SELECT
    }) {
    projectV2Field {
      id
    }
  }
}' -f project=$PROJECT_ID --jq '.data.createProjectV2Field.projectV2Field.id')

echo "📊 Status field created: $STATUS_FIELD_ID"

############################################
# 3. ADD STATUS OPTIONS (COLUMNS)
############################################

add_status () {
  gh api graphql -f query='
    mutation($project:ID!, $field:ID!, $value:String!) {
      createProjectV2FieldOption(input:{
        projectId:$project,
        fieldId:$field,
        name:$value
      }) {
        projectV2FieldOption { id }
      }
    }' \
    -f project=$PROJECT_ID \
    -f field=$STATUS_FIELD_ID \
    -f value="$1"
  echo "➡️ Added column: $1"
}

add_status "Backlog"
add_status "2026 Q1"
add_status "2026 Q2"
add_status "2026 Q3"
add_status "2026 Q4"
add_status "2027 Scale-Up"
add_status "2028 Global Expansion"
add_status "2029 Unified System"

############################################
# 4. CREATE ISSUES + ADD TO PROJECT
############################################

create_issue () {
  ISSUE_JSON=$(gh api repos/mattis-code/neurotoken-zk-health-system/issues \
    -f title="$1" \
    -f labels="$2" \
    -f body="$3")

  ISSUE_ID=$(echo "$ISSUE_JSON" | jq -r '.node_id')

  gh api graphql -f query='
    mutation($project:ID!, $issue:ID!) {
      addProjectV2ItemById(input:{
        projectId:$project,
        contentId:$issue
      }) {
        item { id }
      }
    }' \
    -f project=$PROJECT_ID \
    -f issue=$ISSUE_ID

  echo "🧩 Added issue to project: $1"
}

create_issue "Implement ZK-Light Engine v0.2" "zk,high-priority" "Core zero-knowledge engine iteration."
create_issue "BHBR Reserve Layer — Bitcoin validation module" "high-priority" "Foundation of the health economy."
create_issue "BHT — Utility Token Layer v1" "sdk,web3" "First version of utility layer."
create_issue "Python SDK v1" "sdk" "Developer tooling for integrations."
create_issue "JavaScript SDK v1" "sdk" "Includes client + signing helpers."
create_issue "Web3 Bridge Router" "web3" "EVM + Bitcoin dual routing."
create_issue "Compliance Framework v1" "compliance" "GDPR, ZK, privacy rules."
create_issue "Architecture Docs Finalization" "docs" "System documentation and diagrams."
create_issue "Developer Portal Expansion" "docs" "More guides, examples."
create_issue "HEaS Pilot Prep" "high-priority" "Health Economy as a Service."

############################################
# 5. FINAL LOG
############################################

echo "🎉 SCRIPT 22 FULLFØRT — Projects Board opprettet"
echo "📌 Se boards her:"
echo "https://github.com/users/mattis-code/projects"
