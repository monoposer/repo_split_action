#!/bin/bash

set -e

if [ -z "$INPUT_PKG_NAME" ]; then
  echo '::error::Required pkg_name parameter'
  exit 1
fi

if [ -z "$INPUT_REPO_HOST" ]; then
  echo '::error::Required repo_host parameter'
  exit 1
fi

if [ -z "$INPUT_REPO_ORG" ]; then
  echo '::error::Required repo_org parameter'
  exit 1
fi

if [ -z "$INPUT_BRANCH" ]; then
  echo '::error::Required branch parameter'
  exit 1
fi