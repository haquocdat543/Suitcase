#!/bin/bash

export NEWGROUP=$1
export ROLE=$2

mkdir -p $HOME/.kubernetes/groups/$NEWGROUP

cat << EOF | sudo tee -a $HOME/.kubernetes/groups/$NEWGROUP/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: $ROLE
rules:
- apiGroups: ["","extensions","apps"]
  resources: ["pods","deployments","replicasets"]
  verbs: ["get","list","watch","create","patch","delete","update"] # get | list | watch | create | update | patch | delete
EOF

cat << EOF | sudo tee -a $HOME/.kubernetes/groups/$NEWGROUP/groupbind.yaml
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: $NEWGROUP-role-binding
subjects:
- kind: Group
  name: $NEWGROUP
  apiGroup: rbac.authorization.k8s.io
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole  # Use ClusterRole for cluster-wide access (or Role for namespaced access)
  name: $ROLE # Replace with the actual role name
EOF
