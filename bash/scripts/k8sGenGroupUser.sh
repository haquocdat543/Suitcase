#!/bin/bash

export NEWUSER=$1
export NEWGROUP=$2

mkdir -p $HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER
openssl genrsa -out $HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/$NEWUSER.key 2048
openssl req -new -key $HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/$NEWUSER.key -out $HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/$NEWUSER.csr -subj "/CN=$NEWUSER/O=$NEWGROUP"
sudo openssl x509 -req -in $HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/$NEWUSER.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out $HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/$NEWUSER.crt -days 1800
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config
export KUBECONFIG=$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config
sudo sed "/client-certificate-data/d" "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config" > "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config.tmp" && mv "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config.tmp" "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config" || echo "Error: Failed to remove lines with string 'client-certificate-data' from '$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config'"
sudo sed "/client-key-data/d" "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config" > "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config.tmp" && mv "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config.tmp" "$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config" || echo "Error: Failed to remove lines with string 'client-key-data' from '$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/config'"
kubectl config set-credentials $NEWUSER --client-certificate=$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/$NEWUSER.crt --client-key=$HOME/.kubernetes/groups/$NEWGROUP/$NEWUSER/$NEWUSER.key
kubectl config set-context $NEWUSER-context --cluster=kubernetes --user=$NEWUSER
export KUBECONFIG=$HOME/.kube/config
