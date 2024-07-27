#!/bin/bash

POD_NAME=${1}

kubectl get pod ${POD_NAME} -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}'
