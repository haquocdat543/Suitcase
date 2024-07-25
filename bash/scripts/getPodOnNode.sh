#!/bin/bash

# get first argument as node name
NODE_NAME=${1}

# command that get pod on a node
kubectl get pods --all-namespaces --field-selector spec.nodeName=${NODE_NAME}
