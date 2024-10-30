#!/bin/bash

# set up basic variable
GITHUB_URL="https://github.com/luksa/kubectl-plugins"
LOCAL_PATH="$HOME/kubectl-plugins"

# check repository exist
if [[ ! -d ${LOCAL_PATH} ]]; then
	git clone ${GITHUB_URL} ${LOCAL_PATH}
	export PATH="${PATH}:${LOCAL_PATH}"
else
	cd ${LOCAL_PATH}
	git pull
	export PATH="${PATH}:${LOCAL_PATH}"
	cd -
fi
