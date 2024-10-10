#!/bin/bash

set -x

CLUSTER_NAME=${1}
TASK_ID=${2}
CONTAINER_NAME=${3}
CMD=${4}

aws ecs execute-command --cluster ${CLUSTER_NAME} \
--task ${TASK_ID} \
--container ${CONTAINER_NAME} \
--interactive \
--command ${CMD}

set +x
