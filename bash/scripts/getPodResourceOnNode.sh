#!/bin/bash

# get first argument as node name
NODE_NAME=${1}

# get pod list running on node
POD_LIST=$(kubectl get pods --all-namespaces --field-selector spec.nodeName=${NODE_NAME} -o custom-columns=NAME:.metadata.name --no-headers)

# loop for top each pod in a node
for POD in ${POD_LIST}; do
  kubectl top pod ${POD} --all-namespaces --no-headers
done
