#!/bin/bash

# Loop through each line in the file
while IFS= read -r line; do
  # Check if the line starts with "export" (case-insensitive)
  if [[ "${line}" =~ ^export ]]; then
    # Add #PRESERVE to the end of the line, preserving existing comments
    new_line="${line%%#*} #PRESERVE"  # Remove trailing comments
    new_line="${new_line} # ${line#*#}"  # Add original comments back if any
    echo "$new_line"
  else
    # Print the line unchanged if it doesn't start with "export"
    echo "$line"
  fi
done < "$1"


