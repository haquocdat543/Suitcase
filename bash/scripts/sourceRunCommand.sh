#!/bin/bash

set -x

# Get the current shell command (e.g., "-bash", "zsh", etc.)
CURRENT_SHELL=$(ps -p $$ -o "comm=")

# If CURRENT_SHELL starts with "-", strip the leading "-"
if [[ ${CURRENT_SHELL} == -* ]]; then
   CURRENT_SHELL="${CURRENT_SHELL#-}"
fi

BASE_CURRENT_SHELL=$(basename "${CURRENT_SHELL}")

# Print current shell
echo "Current shell: ${BASE_CURRENT_SHELL}"

# Select the appropriate RC file based on the shell
if [[ ${BASE_CURRENT_SHELL} == "bash" ]]; then
   RUN_COMMAND_FILE=".bashrc"
elif [[ ${BASE_CURRENT_SHELL} == "sh" ]]; then
   RUN_COMMAND_FILE=".bashrc"
elif [[ ${BASE_CURRENT_SHELL} == "zsh" ]]; then
   RUN_COMMAND_FILE=".zshrc"
fi

# Source the appropriate RC file
source "${HOME}/${RUN_COMMAND_FILE}"

set +x
