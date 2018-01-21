#!/usr/bin/env bash

USERNAME=$(lpass show 6437354096189029998 --username)
PASSWORD=$(lpass show 6437354096189029998 --password)
URL=$(lpass show 6437354096189029998 --url)
CA_CERT=$(lpass show 6437354096189029998 --notes)

TARGET=$1
TEAM=$2

if [ -z "$TARGET" ]; then
  TARGET=airplane
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
    --team-name="$TEAM" \
    --ca-cert=caCert.pem
}

function logout() {
  fly -t "$TARGET" logout
}

function sync() {
  fly -t "$TARGET" sync
}

function main() {
  creds
  login
  sync
  clean
}

main
