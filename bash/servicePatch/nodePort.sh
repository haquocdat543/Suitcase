#!/bin/bash

echo "enter namespace name"
read namespace
echo "enter service name "
read serviceName
echo " $namespace and $serviceName "
kubectl patch svc $serviceName -n $namespace -p '{"spec": {"type": "NodePort"}}'
kubectl get service -n $namespace | grep $serviceName
