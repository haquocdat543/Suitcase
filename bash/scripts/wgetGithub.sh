#!/bin/bash

# Get url from user input
URL=$1

# Use IFS to split the URL by '/'
IFS='/' read -r -a parts <<< "${URL}"

# Just get from github username untill the end
PART_INDEX=3

# Concatenate from the third part to the end
CONCATENATED_STRING=""
for (( i=${PART_INDEX}; i<${#parts[@]}; i++ )); do
    CONCATENATED_STRING+="${parts[i]}"
    if [[ $i -lt $(( ${#parts[@]} - 1 )) ]]; then
        CONCATENATED_STRING+="/"
    fi
done

# get nessary part of input url
PROTOCOL="${parts[0]}"
DOMAIN="${parts[2]}"
USER="${parts[3]}"
REPO="${parts[4]}"
BLOB="${parts[5]}"
BRANCH="${parts[6]}"

# check if domain is from github
GITHUB_DOMAIN="github.com"

if [[ ${DOMAIN} != ${GITHUB_DOMAIN} ]]
then
  echo "This script only support Github only"
  exit 1
fi

# remove blob
CONCATENATED_STRING=$(echo ${CONCATENATED_STRING} | sed 's/blob\///g' )

# Define raw github user content protocol and domain
GITHUB_RAW_PROTOCOL="https"
GITHUB_RAW_DOMAIN="raw.githubusercontent.com"

# Concate to last github raw content url
GITHUB_RAW_CONTENT_URL="${GITHUB_RAW_PROTOCOL}://${GITHUB_RAW_DOMAIN}/${CONCATENATED_STRING}"

# get file to local
wget ${GITHUB_RAW_CONTENT_URL}
