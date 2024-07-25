#!/bin/bash

# Get the node name from the first argument
NODE_NAME=$1

# Get the list of pods running on the node, including their namespaces
POD_LIST=$(kubectl get pods --all-namespaces --field-selector spec.nodeName=${NODE_NAME} -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name --no-headers)

# declare result 
RESULT=""

# Loop over each pod in the list
while read -r NAMESPACE POD; do
  # Get CPU and memory usage for each pod
  RESULT+="$(kubectl top pod ${POD} --namespace=${NAMESPACE} --no-headers)\n"
done <<< "$POD_LIST"

# print out result
echo -e ${RESULT} | column -t
