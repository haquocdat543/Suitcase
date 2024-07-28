#!/bin/bash

ROLE_NAME=${1}

kubectl get role ${ROLE_NAME} -o yaml
