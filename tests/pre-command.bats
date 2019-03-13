#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

# Uncomment to enable stub debugging
export AZ_STUB_DEBUG=/dev/tty

@test "calls az acr login --name " {
  export BUILDKITE_PLUGIN_AZURE_ACR_LOGIN_NAME=MyAcr

  stub az "acr login --name ${BUILDKITE_PLUGIN_AZURE_ACR_LOGIN_NAME} : echo logging in to Azure ACR"

  run $PWD/hooks/pre-command

  assert_output --partial "logging in to Azure ACR"
  assert_success
  
  unstub az
  unset BUILDKITE_PLUGIN_AZURE_ACR_LOGIN_NAME
}

@test "calls az acr login without --name fails" {
  # unset BUILDKITE_PLUGIN_AZURE_ACR_LOGIN_NAME

  stub az "acr login"

  run $PWD/hooks/pre-command

  assert_failure

  
}