#!/bin/bash -e

GHR=$(which gh-release)
if [[ ! -e "${GHR}" ]]; then
  echo "Please install gh-release: yarn global add gh-release"
  exit -1
fi


GHR_OPTS=""
if [[ -e ./local.env ]];then
  echo "Loading local env"
  . ./local.env
fi

ARCHIVE=$(ls -a *.tgz | tail -1)

if [[ ! -e ${ARCHIVE} ]];then
  echo "No archive found"
  exit -1
fi

git push --tags
gh-release ${GHR_OPTS} -a ${ARCHIVE} -y
