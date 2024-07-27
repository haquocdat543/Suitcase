#!/bin/bash

kubectl get svc --all-namespaces -o jsonpath='{range .items[*]}{.metadata.name}.{.metadata.namespace}.svc.cluster.local:{range .spec.ports[*]}{.port}{"\n"}{end}{end}'
