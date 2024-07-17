#!/bin/bash

# get arguments
NEW_KUBECONFIG_PATH=$1

# check arguments
if [ $# -ne 1 ]; then
    echo "Usage:  <NEW_KUBECONFIG_PATH>"
    echo "Eg: $0 ~/Downloads/kubeconfig"
    exit 1
fi

# define basic variables
DEFAULT_KUBECONFIG_PATH="$HOME/.kube/config"
BACKUP_KUBECONFIG_PATH="$HOME/.kube/config.backup"
TMP_KUBECONFIG_PATH="/tmp/config"
KUBE_COMMAND="kubectl config view --merge --flatten"

# make a backup of default kube config
cp ${DEFAULT_KUBECONFIG_PATH} ${BACKUP_KUBECONFIG_PATH}

# make a backup of default kube config
KUBECONFIG=${DEFAULT_KUBECONFIG_PATH}:${NEW_KUBECONFIG_PATH} ${KUBE_COMMAND} > ${TMP_KUBECONFIG_PATH}
mv ${TMP_KUBECONFIG_PATH} ${DEFAULT_KUBECONFIG_PATH}
