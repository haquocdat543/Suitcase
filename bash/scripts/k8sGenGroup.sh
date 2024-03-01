#!/bin/bash

export NEWGROUP=$1
export NAMESPACE=$2

mkdir -p $HOME/.kubernetes/groups/$NEWGROUP
cat << EOF | sudo tee -a $HOME/.kubernetes/groups/$NEWGROUP/group.yaml
apiVersion: v1
kind: Group
metadata:
  name: $NEWGROUP
EOF

cat << EOF | sudo tee -a $HOME/.kubernetes/groups/$NEWGROUP/role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: $NEWGROUP
  namespace: $NAMESPACE
rules:
- apiGroups: ["","extensions","apps"]
  resources: ["pods","deployments","replicasets"]
  verbs: ["get","list","watch","create","patch","delete","update"] # get | list | watch | create | update | patch | delete
EOF

cat << EOF | sudo tee -a $HOME/.kubernetes/groups/$NEWGROUP/rolebind.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: $NEWGROUP
  namespace: $NAMESPACE
subjects:
- kind: Group
  name: $NEWGROUP
  apiGroup: ""
roleRef:
  kind: Role
  name: $NEWGROUP
  apiGroup: ""
EOF

cat << EOF | sudo tee -a $HOME/.kubernetes/groups/$NEWGROUP/userbind.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: UserSubjectBind
metadata:
  name: $USER-bind-to-$NEWGROUP
subjects:
- kind: User
  name: $USER
objectRef:
  kind: Group
  name: $NEWGROUP
EOF
