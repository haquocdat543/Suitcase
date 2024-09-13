#!/bin/bash

set -x

CURRENT_SHELL=$(ps -p $$ -o "comm=")

if [[ ${CURRENT_SHELL} == "-bash" ]]; then
   CURRENT_SHELL="bash"

BASE_CURRENT_SHELL=$(basename ${CURRENT_SHELL})

# Print current shell
echo "Current shell: ${BASE_CURRENT_SHELL}"

if [[ ${BASE_CURRENT_SHELL} == "bash" ]]; then
   RUN_COMMAND_FILE=".bashrc"
elif [[ ${BASE_CURRENT_SHELL} == "sh" ]]; then
   RUN_COMMAND_FILE=".bashrc"
elif [[ ${BASE_CURRENT_SHELL} == "zsh" ]]; then
   RUN_COMMAND_FILE=".zshrc"
fi

source ${HOME}/${RUN_COMMAND_FILE}

set +x
