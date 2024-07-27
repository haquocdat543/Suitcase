#!/bin/bash

COMMAND=${1}
POD_NAME=${2}

kubectl exec -it ${POD_NAME} -- ${COMMAND}
