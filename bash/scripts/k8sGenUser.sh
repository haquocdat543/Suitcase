#!/bin/bash

export NEWUSER=$1
export NAMESPACE=$2

mkdir -p $HOME/.kubernetes/users/$NEWUSER
openssl genrsa -out $HOME/.kubernetes/users/$NEWUSER/$NEWUSER.key 2048
openssl req -new -key $HOME/.kubernetes/users/$NEWUSER/$NEWUSER.key -out $HOME/.kubernetes/users/$NEWUSER/$NEWUSER.csr -subj "/CN=$NEWUSER/O=k8s"
sudo openssl x509 -req -in $HOME/.kubernetes/users/$NEWUSER/$NEWUSER.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out $HOME/.kubernetes/users/$NEWUSER/$NEWUSER.crt -days 1800
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kubernetes/users/$NEWUSER/config
export KUBECONFIG=$HOME/.kubernetes/users/$NEWUSER/config
sudo sed "/client-certificate-data/d" "$HOME/.kubernetes/users/$NEWUSER/config" > "$HOME/.kubernetes/users/$NEWUSER/config.tmp" && mv "$HOME/.kubernetes/users/$NEWUSER/config.tmp" "$HOME/.kubernetes/users/$NEWUSER/config" || echo "Error: Failed to remove lines with string 'client-certificate-data' from '$HOME/.kubernetes/users/$NEWUSER/config'"
sudo sed "/client-key-data/d" "$HOME/.kubernetes/users/$NEWUSER/config" > "$HOME/.kubernetes/users/$NEWUSER/config.tmp" && mv "$HOME/.kubernetes/users/$NEWUSER/config.tmp" "$HOME/.kubernetes/users/$NEWUSER/config" || echo "Error: Failed to remove lines with string 'client-key-data' from '$HOME/.kubernetes/users/$NEWUSER/config'"
kubectl config set-credentials $NEWUSER --client-certificate=$HOME/.kubernetes/users/$NEWUSER/$NEWUSER.crt --client-key=$HOME/.kubernetes/users/$NEWUSER/$NEWUSER.key
kubectl config set-context $NEWUSER-context --cluster=kubernetes --user=$NEWUSER --namespace=$NAMESPACE
export KUBECONFIG=$HOME/.kube/config

cat << EOF | sudo tee -a $HOME/.kubernetes/users/$NEWUSER/role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: $NEWUSER
  namespace: $NAMESPACE
rules:
- apiGroups: ["","extensions","apps"]
  resources: ["pods","deployments","replicasets"]
  verbs: ["get","list","watch","create","patch","delete","update"] # get | list | watch | create | update | patch | delete
EOF

cat << EOF | sudo tee -a $HOME/.kubernetes/users/$NEWUSER/rolebind.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: $NEWUSER
  namespace: $NAMESPACE
subjects:
- kind: User
  name: $NEWUSER
  apiGroup: ""
roleRef:
  kind: Role
  name: $NEWUSER
  apiGroup: ""
EOF

