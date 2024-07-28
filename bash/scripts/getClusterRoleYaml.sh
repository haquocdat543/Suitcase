#!/bin/bash

CLUSTER_ROLE_NAME=${1}

kubectl get clusterrole ${CLUSTER_ROLE_NAME} -o yaml
