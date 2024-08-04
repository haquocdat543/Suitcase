#!/bin/bash

POD_NAME=${1}
CONTAINER_PATH=${2}
LOCAL_PATH=${3}
CONTAINER_NAME=${4}

if [[ -z ${CONTAINER_NAME} ]]; then
  kubectl cp ${LOCAL_PATH} ${POD_NAME}:${CONTAINER_PATH}
else
  kubectl cp ${LOCAL_PATH} ${POD_NAME}:${CONTAINER_PATH} -c ${CONTAINER_NAME}
fi
