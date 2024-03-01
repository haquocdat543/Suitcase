#!/bin/bash

# Iterate through each line in the file
while IFS= read -r line; do
  # Check if the line starts with "export" (case-insensitive) and doesn't end with "#PRESERVE"
  if [[ "${line}" =~ ^export ]] && [[ ! "${line}" =~ #PRESERVE$ ]]; then
    # Skip printing the line (effectively deleting it)
    continue
  fi

  # Print the line if it doesn't meet the deletion criteria
  echo "$line"
done < "$1"


