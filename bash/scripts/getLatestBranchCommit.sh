#!/bin/bash

# Get the latest commit hash, branch name, and commit datetime
LATEST_COMMIT_INFO=$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:iso8601) %(objectname) %(refname:short)' | head -n 1)

# Extract the commit datetime, commit hash, and branch name
LATEST_COMMIT_DATETIME=$(echo $LATEST_COMMIT_INFO | awk '{print $1}')
LATEST_COMMIT_HASH=$(echo $LATEST_COMMIT_INFO | awk '{print $2}')
LATEST_BRANCH=$(echo $LATEST_COMMIT_INFO | awk '{print $3}')

# Print the branch with the latest commit, its hash, and datetime
echo "Branch with the latest commit: $LATEST_BRANCH"
echo "Latest commit hash: $LATEST_COMMIT_HASH"
echo "Latest commit datetime: $LATEST_COMMIT_DATETIME"
