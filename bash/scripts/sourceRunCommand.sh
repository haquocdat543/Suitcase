#!/bin/bash

CURRENT_SHELL=$(basename $(ps -p $$ -o "comm="))

# Print current shell
echo "Current shell: ${CURRENT_SHELL}"

if [[ ${CURRENT_SHELL} == "bash" ]]; then
   RUN_COMMAND_FILE="bashrc"
elif [[ ${CURRENT_SHELL} == "sh" ]]; then
   RUN_COMMAND_FILE="bashrc"
elif [[ ${CURRENT_SHELL} == "zsh" ]]; then
   RUN_COMMAND_FILE="zshrc"
fi

RC_FILE=".${RUN_COMMAND_FILE}"
source ${RC_FILE}
