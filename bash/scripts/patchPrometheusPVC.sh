#!/bin/bash

# Ensure a new volume size is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <NEW-VOLUME-SIZE>"
  exit 1
fi

NEW_VOLUME_SIZE=$1

# Patch Prometheus to pause and update volume size
kubectl patch prometheus/example --patch "{\"spec\": {\"paused\": true, \"storage\": {\"volumeClaimTemplate\": {\"spec\": {\"resources\": {\"requests\": {\"storage\":\"${NEW_VOLUME_SIZE}\"}}}}}}}" --type merge

# Update PVCs with new volume size
for p in $(kubectl get pvc -l operator.prometheus.io/name=example -o jsonpath='{.items[*].metadata.name}'); do
  kubectl patch pvc/${p} --patch "{\"spec\": {\"resources\": {\"requests\": {\"storage\":\"${NEW_VOLUME_SIZE}\"}}}}" --type merge
done

# Delete the statefulset but keep its pods
kubectl delete statefulset -l operator.prometheus.io/name=example --cascade=orphan

# Unpause Prometheus
kubectl patch prometheus/example --patch "{\"spec\": {\"paused\": false}}" --type merge
