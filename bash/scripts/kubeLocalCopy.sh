#!/bin/bash

POD_NAME=${1}
CONTAINER_PATH=${2}
LOCAL_PATH=${3}
CONTAINER_NAME=${4}

if [[ -z ${CONTAINER_NAME} ]]; then
  kubectl cp ${POD_NAME}:${CONTAINER_PATH} ${LOCAL_PATH}
else
  kubectl cp ${POD_NAME}:${CONTAINER_PATH} ${LOCAL_PATH} -c ${CONTAINER_NAME}
fi
