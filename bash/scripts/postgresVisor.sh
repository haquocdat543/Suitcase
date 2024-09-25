#!/bin/bash

OPERATION=${1}

read -r -d '' YAML_CONFIG <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres-visor
  labels:
    app: postgres-visor
spec:
  replicas: 1
  revisionHistoryLimit: 10
  strategy: # change here
    type: RollingUpdate # you can choose Recreate instead of RollingUpdate
  selector:
    matchLabels:
      app: postgres-visor
  template:
    metadata:
      labels:
        app: postgres-visor
    spec:
      containers:
      - name: postgres-visor
        image: postgres:latest
        command: ["/bin/bash", "-c", "--"]
        args: 
          - |
            while true; do sleep 30; done;
EOF

echo "${YAML_CONFIG}" | kubectl ${OPERATION} -f - 
