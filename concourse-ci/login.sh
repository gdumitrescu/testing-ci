#!/usr/bin/env bash

USERNAME=$(lpass show 7906497051561120514 --username)
PASSWORD=$(lpass show 7906497051561120514 --password)
URL=$(lpass show 7906497051561120514 --url)

TARGET=$1
TEAM=$2

if [ -z "$TARGET" ]; then
  TARGET=cibox
fi

if [ -z "$TEAM" ]; then
  TEAM=main
fi


function clean() {
  rm caCert.pem
}

function creds() {
  echo "$CA_CERT" > caCert.pem
  chmod 600 caCert.pem
}

function login() {
  fly -t "$TARGET" login \
    --concourse-url="$URL" \
    --username="$USERNAME" \
    --password="$PASSWORD" \
    --team-name="$TEAM"
}

function logout() {
  fly -t "$TARGET" logout
}

function sync() {
  fly -t "$TARGET" sync
}

function main() {
  login
  sync
}

main
