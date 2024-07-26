#!/bin/bash

# Get the namespace name from the first argument
NAMESPACE=$1

# Get the list of pods running in the namespace
POD_LIST=$(kubectl get pods -n ${NAMESPACE} -o custom-columns=NAME:.metadata.name --no-headers)

# Declare the result variable
RESULT=""

# Loop over each pod in the list
while read -r POD; do
  # Get CPU and memory usage for each pod
  USAGE=$(kubectl top pod ${POD} --namespace=${NAMESPACE} --no-headers 2>/dev/null)
  
  # If `kubectl top pod` fails, set usage to "--"
  if [ -z "$USAGE" ]; then
    USAGE="${POD} -- --"
  fi

  # Append the usage to the result
  RESULT+="${USAGE}\n"
done <<< "$POD_LIST"

# Print out the result in columns
echo -e ${RESULT} | column -t
