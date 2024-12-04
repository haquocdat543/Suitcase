#!/bin/bash

STATEFULSET=${1}
NAMESPACE=${2}
NUMBER=${3}

kubectl scale statefulset ${STATEFULSET} -n ${NAMESPACE} --replicas=${NUMBER}
