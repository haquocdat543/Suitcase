#!/bin/bash

# set up basic variable
GITHUB_URL="https://github.com/luksa/kubectl-plugins"
LOCAL_PATH="$HOME/kubectl-plugins"

# clone and add to PATH
git clone ${GITHUB_URL} ${LOCAL_PATH}
export PATH="${PATH}:${LOCAL_PATH}"
