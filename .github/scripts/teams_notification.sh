#!/bin/sh

GITHUB_RELEASE_URL="https://github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/releases/tag/${CIRCLE_TAG}"

PARSE_MODE="Markdown"

send_msg () {
  local payload="
  {
  \"@context\": \"https://schema.org/extensions\",
  \"@type\": \"MessageCard\",
  \"title\": \"&#x1F4E2; LFET Maven Plugin Release\",
  \"text\": \"${1}\",
  \"potentialAction\": [
    {
      \"@type\": \"OpenUri\",
      \"name\": \"Download Release Artifacts here\",
      \"targets\": [
        { \"os\": \"default\", \"uri\": \"https://github.com/uniqueck/lfet-api-maven-plugin/releases/tag/v0.2.0-210105a-alpha\" }
      ]
    }
  ]
}"


  curl --location --request POST ${MS_TEAMS_WEBHOOK_URL} \
  --header 'Content-Type: application/json' \
  --data-raw "${payload}"
}


sed -i -e 's/:ant:/\&#x1F41B;/g' \
-e 's/:package:/\&#x1F4E6;/g' \
-e 's/:telescope:/\&#x1F52D;/g' \
-e 's/:broom:/\&#x1F9F9;/g' \
-e 's/:memo:/\&#x1F4D2;/g' \
release-notes.md

send_msg "$(cat release-notes.md)"