#!/bin/bash

OPERATION=${1}

read -r -d '' YAML_CONFIG <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: centos-visor
  labels:
    app: centos-visor
spec:
  replicas: 1
  revisionHistoryLimit: 10
  strategy: # change here
    type: RollingUpdate # you can choose Recreate instead of RollingUpdate
  selector:
    matchLabels:
      app: centos-visor
  template:
    metadata:
      labels:
        app: centos-visor
    spec:
      containers:
      - name: centos-visor
        image: centos:latest
        command: ["/bin/bash", "-c", "--"]
        args: 
          - |
            cd /etc/yum.repos.d/;
            sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*;
            sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*;
            curl -Ls -o- https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/scripts/alias.sh | bash;
            source /root/.bashrc;
            upi;
            while true; do sleep 30; done;
EOF

echo "${YAML_CONFIG}" | kubectl ${OPERATION} -f - 
