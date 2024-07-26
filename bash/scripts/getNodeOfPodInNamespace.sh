#!/bin/bash

NAMESPACE=${1}

kubectl get pods -n ${NAMESPACE} -o custom-columns=POD:.metadata.name,NODE:.spec.nodeName
