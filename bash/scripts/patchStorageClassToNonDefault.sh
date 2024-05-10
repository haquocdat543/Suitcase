#!/bin/bash

# export environment variable
export STORAGE_CLASS_NAME=$1

# patch storage class by name
kubectl patch storageclass $STORAGE_CLASS_NAME -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
