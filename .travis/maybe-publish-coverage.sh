#!/bin/bash

source $(npm root -g)/pr-bumper/.travis/is-bump-commit.sh

if isBumpCommit
then
  echo "Skipping pr-bumper coverage publish step for version bump commit"
  exit 0
fi

if [[ ! "${PUBLISH_NODE_VERSION:-8.1.2}" =~ ^$TRAVIS_NODE_VERSION ]]
then
  echo "Skipping pr-bumper coverage publish step for TRAVIS_NODE_VERSION [${TRAVIS_NODE_VERSION}]"
  exit 0
fi

cat coverage/lcov.info | coveralls
