#!/bin/bash

# variable declaration
OPTION=${1}
GIT_SERVER=${2}
ORGANIZATION_OR_USER=${3}
REPOSITORY_NAME=${4}

function git::repository::clone () {

  # clone operation
  GIT_URL="git@${GIT_SERVER}:${ORGANIZATION_OR_USER}/${REPOSITORY_NAME}.git"
  LOCAL_PATH="${HOME}/preconfig/repositories/${REPOSITORY_NAME}"
  git clone ${GIT_URL} ${LOCAL_PATH}

}

case ${OPTION} in
  "1")
    git::repository::clone ${GIT_SERVER} ${ORGANIZATION_OR_USER} ${REPOSITORY_NAME}
    ;;
  *)
    echo "Wrong option"
    ;;
esac
