#!/bin/bash

# variable declaration
OPTION=${1}
GIT_SERVER=${2}
ORGANIZATION_OR_USER=${3}
REPOSITORY_NAME=${4}

GIT_URL="git@${GIT_SERVER}:${ORGANIZATION_OR_USER}/${REPOSITORY_NAME}.git"

function git::repository::pull () {

  DIRECTORY=${1}

  cd ${DIRECTORY}
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git reset --hard HEAD~1
  git pull origin main -f
  cd -
  
}

function git::repository::exist () {

  DIRECTORY=${1}
  FUNCTION=${2}

}

function git::repository::pull::preconfig () {

  LOCAL_PATH="${HOME}/preconfig/repositories/${REPOSITORY_NAME}"

  if [ -d "${DIRECTORY}" ]; then
    git::repository::pull ${LOCAL_PATH}
  else
    git clone ${GIT_URL} ${LOCAL_PATH}
  fi

}

function git::repository::pull::home () {

  LOCAL_PATH="${HOME}/${REPOSITORY_NAME}"

  if [ -d "${DIRECTORY}" ]; then
    git::repository::pull ${LOCAL_PATH}
  else
    git clone ${GIT_URL} ${LOCAL_PATH}
  fi

}

case ${OPTION} in
  "1")
    git::repository::pull::preconfig 
    ;;
  "2")
    git::repository::pull::home
    ;;
  *)
    echo "Wrong option"
    ;;
esac
