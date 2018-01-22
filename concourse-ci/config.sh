#!/usr/bin/env bash

TARGET=$1
PIPELINE=$2

if [ -z "$TARGET" ]; then
  TARGET=airplane
fi

if [ -z "$PIPELINE" ]; then
  PIPELINE=test
fi

function creds() {
  PRIVATE_KEY=$(lpass show --notes 1189151451382424461)
  SNYK_TOKEN=$(lpass show --notes 2717732389534344821 | grep token | awk '{print $2}')
  SNYK_USER_ID=$(lpass show 2717732389534344821 | grep Username | awk '{print $2}')
}

function config() {
  fly -t "$TARGET" set-pipeline \
    --pipeline="$PIPELINE" \
    --config=./pipelines/"$PIPELINE"/pipeline.yml \
    --var=private-key="$PRIVATE_KEY" \
    --var=snyk-token="$SNYK_TOKEN" \
    --var=snyk-user-id="$SNYK_USER_ID"
  fly -t "$TARGET" unpause-pipeline --pipeline="$PIPELINE"
  fly -t "$TARGET" expose-pipeline --pipeline="$PIPELINE"
}
function main () {
  creds
  config
}

main
