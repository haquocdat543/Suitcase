#!/bin/bash

read -p "$(echo -e "Enter ${yellow}namespace ${purple}name${nc} [${green2}default${nc}]: ")" namespace
namespace=${namespace:-default}
read -p "$(echo -e "Enter ${yellow}service ${purple}name${nc} [${green2}argocd-server${nc}]: ")" service
service=${service:-argocd-server}
echo " $namespace and $service "
kubectl patch svc $service -n $namespace -p '{"spec": {"type": "ClusterIP"}}'
kubectl get service -n $namespace | grep $service
