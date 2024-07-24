#!/bin/bash

# Get the latest commit hash, branch name, and commit datetime
LATEST_COMMIT_INFO=$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:iso8601) %(objectname) %(refname:short)' | head -n 1)

# Extract the commit datetime, commit hash, and branch name
LATEST_COMMIT_DATETIME=$(echo $LATEST_COMMIT_INFO | awk '{print $1 $2 $3}')
LATEST_COMMIT_HASH=$(echo $LATEST_COMMIT_INFO | awk '{print $4}')
LATEST_BRANCH=$(echo $LATEST_COMMIT_INFO | awk '{print $5}')

# Print the branch with the latest commit, its hash, and datetime
echo "Latest commit is [ ${LATEST_COMMIT_HASH} ] on branch [ ${LATEST_BRANCH} ] at [ ${LATEST_COMMIT_DATETIME} ]"
