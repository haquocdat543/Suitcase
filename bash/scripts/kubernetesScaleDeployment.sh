#!/bin/bash

DEPLOYMENT=${1}
NAMESPACE=${2}
NUMBER=${3}

kubectl scale deployment ${DEPLOYMENT} -n ${NAMESPACE} --replicas=${NUMBER}
