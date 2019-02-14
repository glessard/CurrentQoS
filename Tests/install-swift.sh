#!/bin/bash
set -e

if [[ -n "$SWIFT" ]]
then
  if [[ -n "$VERSION" ]]
  then
    export LANGUAGE_VERSION="${VERSION}"
  fi
  export COMPILER_VERSION=$SWIFT
  export COMPILER_MAJOR_VERSION=`echo $SWIFT | awk -F . '{print $1}'`

  COMPILER="swift-${COMPILER_VERSION}-RELEASE"
  BRANCH="swift-${COMPILER_VERSION}-release"
  URLBASE="https://swift.org/builds/${BRANCH}"

  if [[ "$TRAVIS_OS_NAME" == "linux" ]]
  then
    PLATFORM="ubuntu1604"
    BASENAME="${COMPILER}-ubuntu16.04"

    # install swift
    cd ..
    curl -s -O ${URLBASE}/${PLATFORM}/${COMPILER}/${BASENAME}.tar.gz
    tar xzf ${BASENAME}.tar.gz
    export PATH="${PWD}/${BASENAME}/usr/bin:${PATH}"
    cd "${TRAVIS_BUILD_DIR}"
  fi
elif [[ -z $(which swift) ]]
then
  echo "Set SWIFT to define which compiler version to install"
  echo "Set VERSION to define which (non-default) language version to compile with"
  exit 1
fi

swift --version
