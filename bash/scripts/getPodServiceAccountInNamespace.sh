#!/bin/bash

NAMESPACE=${1}

kubectl get pods -n ${NAMESPACE} -o go-template='{{range .items}}{{.metadata.name}}{{"\t"}}{{.spec.serviceAccountName}}{{"\n"}}{{end}}'
