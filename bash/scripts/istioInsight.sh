#!/bin/bash

ISTIOD=$(kubectl get -A pods --selector=app=istiod -o jsonpath='{.items[*].metadata.name}')
echo "ISTIO AWARE SERVICES"
kubectl exec -it $ISTIOD -n istio-system -- curl localhost:8080/debug/registryz | jq '.[] | .hostname'
echo "ISTIO INJECTED PROXY"
kubectl exec -it $ISTIOD -n istio-system -- curl localhost:8080/debug/instancesz | jq 'keys'
