#!/bin/bash

COMMAND=${1}
POD_NAME=${2}
CONTAINER_NAME=${3}

if [[ -z ${CONTAINER_NAME} ]]; then
  kubectl exec -it ${POD_NAME} -- ${COMMAND}
else
  kubectl exec -it ${POD_NAME} -c ${CONTAINER_NAME} -- ${COMMAND}
fi
