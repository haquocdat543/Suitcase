#!/bin/bash

# Eg: --untar
OPERATION=${1}

# Eg: istio/gateway
HELM_FULL_NAME=${2}

# pull command
helm pull ${HELM_FULL_NAME} ${OPERATION}
