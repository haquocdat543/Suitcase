#!/bin/bash

SECRET_NAME=${1}
NAMESPACE=${2}

if [[ -z ${NAMESPACE} ]]; then
  kubectl get secret ${SECRET_NAME} -o jsonpath='{.data}' | jq -r 'to_entries[] | "\(.key)=\(.value | @base64d)"'
else
  kubectl get secret ${SECRET_NAME} -n ${NAMESPACE} -o jsonpath='{.data}' | jq -r 'to_entries[] | "\(.key)=\(.value | @base64d)"'
fi
