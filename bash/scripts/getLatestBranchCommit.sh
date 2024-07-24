#!/bin/bash

black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
gray='\033[0;37m'
gray2='\033[1;30m'
red2='\033[1;31m'
green2='\033[1;32m'
yellow='\033[1;33m'
blue2='\033[1;34m'
purple2='\033[1;35m'
cyan2='\033[1;36m'
white='\033[1;37m'
nc='\033[0m' # No Color

# Get the latest commit hash, branch name, and commit datetime
LATEST_COMMIT_INFO=$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:iso8601) %(objectname) %(refname:short)' | head -n 1)

# Extract the commit datetime, commit hash, and branch name
LATEST_COMMIT_DATE=$(echo $LATEST_COMMIT_INFO | awk '{print $1}')
LATEST_COMMIT_TIME=$(echo $LATEST_COMMIT_INFO | awk '{print $2}')
LATEST_COMMIT_OFFSET=$(echo $LATEST_COMMIT_INFO | awk '{print $3}')
LATEST_COMMIT_HASH=$(echo $LATEST_COMMIT_INFO | awk '{print $4}')
LATEST_BRANCH=$(echo $LATEST_COMMIT_INFO | awk '{print $5}')

# Print the branch with the latest commit, its hash, and datetime
echo -e "Latest commit is [ ${green}${LATEST_COMMIT_HASH}${nc} ] on branch [ ${yellow}${LATEST_BRANCH}${nc} ] at [ ${cyan}${LATEST_COMMIT_DATE} ${LATEST_COMMIT_TIME} ${LATEST_COMMIT_OFFSET}${nc} ]"
