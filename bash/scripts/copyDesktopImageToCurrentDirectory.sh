#!/bin/bash

# basic information
DESKTOP_DIRECTORY="/Users/hadat/Desktop"
REGEX=$(date +%Y-%m-%d)
# REGEX="2024-10-17"

# get list images
IMAGES=$(ls -a ${DESKTOP_DIRECTORY} | grep -e "${REGEX}")

# cut line
IFS=$'\n' read -r -d '' -a ARRAY <<< "${IMAGES}"

# loop
for IMAGE in "${ARRAY[@]}"; do
  cp "${DESKTOP_DIRECTORY}/${IMAGE}" .
done
