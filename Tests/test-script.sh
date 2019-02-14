#!/bin/bash
set -e

if [[ -n "${LANGUAGE_VERSION}" ]]
then
  VERSION_OPTION="-Xswiftc -swift-version -Xswiftc ${LANGUAGE_VERSION}"
fi

if [[ $LANGUAGE_VERSION = "3" ]] || [[ $COMPILER_MAJOR_VERSION = "3" ]]
then
  TEST_OPTIONS=""
else
  TEST_OPTIONS="-c release"
fi

swift --version
swift test ${TEST_OPTIONS} ${VERSION_OPTION}
