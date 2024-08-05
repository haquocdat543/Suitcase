#!/bin/bash

kubectl get pods --all-namespaces -L istio.io/rev --no-headers | wc | awk '{print $1}'
