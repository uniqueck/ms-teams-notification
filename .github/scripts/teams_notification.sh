#!/bin/sh

curl --location --request POST "${MS_TEAMS_WEBHOOK_URL}" \
  --header 'Content-Type: application/json' \
  --data-raw "{
                \"@context\": \"https://schema.org/extensions\",
                \"@type\": \"MessageCard\",
                \"title\": \"${RELEASE_TITLE}\",
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