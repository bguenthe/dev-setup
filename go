#!/usr/bin/env bash

set -e

GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"
CHECK="${GREEN}✓${RESET}"
CROSS="${RED}✗${RESET}"
BULLET="${YELLOW}‣${RESET}"

function usage {
  echo "
Usage: go <target>

Targets:
  help      - Display this help
  run       - Start developer environment
  destroy   - Destroy developer environment
  test      - Test that developer environment is setup correctly
"
}

function step {
  echo -e "${GREEN}$1${RESET}"
}

function tick {
  echo -e "${BULLET} $1"
}

function fail {
  echo -e "${CROSS} $1"
}

function success {
  echo -e "${CHECK} $1"
}

function run {
  step "Starting developer environment"

  tick "Create secrets directory"
  mkdir -p provisioning/.secrets

  tick "Link AWS credentials to secrets directory"
  ln -sf ~/.aws/credentials provisioning/.secrets/credentials

  tick "Start vagrant"

  vagrant up

  success "Started developer environment. Run ${YELLOW}vagrant ssh${RESET} to get started."
}

function destroy {
  step "💣 Destroying developer environment"

  vagrant destroy

  success "Destroyed developer environment"
}

function test {
  step "Testing developer environment"

  tick "Installing dependencies"
  bundle install

  tick "Running tests"
  rake spec

  success "Testing developer environment successful"
}


if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

TARGET=$1

case $TARGET in
  "run" )
    run
  ;;

  "destroy" )
    destroy
  ;;

  "test" )
    test
  ;;

  "help" )
    usage
  ;;

  *)
    fail "Unknown command '${TARGET}'"
    usage
    exit 1
  ;;
esac
