#!/bin/sh

GITHUB_RELEASE_URL="https://github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/releases/tag/${CIRCLE_TAG}"

PARSE_MODE="Markdown"

send_msg () {
  curl --location --request POST ${MS_TEAMS_WEBHOOK_URL} \
  --header 'Content-Type: application/json' \
  --data-raw "${1}"
}


send_msg "
{
  \"@context\": \"https://schema.org/extensions\",
  \"@type\": \"MessageCard\",
  \"title\": \"&#x1F4E2; LFET Maven Plugin Release\",
  \"subtitle\": \"v0.2.0-210105a-alpha\",
  \"text\": \"# What's changed
## &#x1F52D;  Features

## &#x1F41B; Bug Fixes

## &#x1F4E6; Dependencies updates

* update lfet version to build 210105a

## &#x1F9F9; Housekeeping

## &#x1F4D2; Documentation\",
  \"potentialAction\": [
    {
      \"@type\": \"OpenUri\",
      \"name\": \"Download Release Artifacts here\",
      \"targets\": [
        { \"os\": \"default\", \"uri\": \"https://github.com/uniqueck/lfet-api-maven-plugin/releases/tag/v0.2.0-210105a-alpha\" }
      ]
    }
  ]
}
"