#!/bin/sh

send_msg () {
  local payload="
  {
  \"@context\": \"https://schema.org/extensions\",
  \"@type\": \"MessageCard\",
  \"title\": \"&#x1F4E2; ${RELEASE_TITLE}\",
  \"text\": \"Release: ${RELEASE_TEXT}\",
  \"potentialAction\": [
    {
      \"@type\": \"OpenUri\",
      \"name\": \"Download Release Artifacts here\",
      \"targets\": [
        { \"os\": \"default\", \"uri\": \"${RELEASE_URL}\" }
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