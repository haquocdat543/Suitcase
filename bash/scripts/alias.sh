#!/bin/bash

set -x

# Update and install git for CentOS
yum update -y
yum install -y git

# Update and install git for Ubuntu
apt update -y
apt install -y git

# Update and install git for Archlinux
pacman -Syu --noconfirm
pacman -Sy --noconfirm git

# Update and install git for Alpine
apk update
apk install git

# Set up environment variables
GIT_REMOTE_URL="https://github.com/haquocdat543/Suitcase.git"

DESTINATION_DIRECTORY="${HOME}/preconfig/Suitcase"

# Clone git suitcase repository
git clone ${GIT_REMOTE_URL} ${DESTINATION_DIRECTORY}

CURRENT_DIRECTORY=$(pwd)
cd ${DESTINATION_DIRECTORY}

git reset --hard HEAD~10
git pull origin main -f

cd ${CURRENT_DIRECTORY}

CURRENT_SHELL=$(basename $(ps -p $$ -o "comm="))

# Print current shell
echo "Current shell: ${CURRENT_SHELL}"

if [[ ${CURRENT_SHELL} =~ "bash" ]]; then
   RUN_COMMAND_FILE="bashrc"
elif [[ ${CURRENT_SHELL} =~ "sh" ]]; then
   RUN_COMMAND_FILE="bashrc"
elif [[ ${CURRENT_SHELL} =~ "zsh" ]]; then
   RUN_COMMAND_FILE="zshrc"
fi

# Setup environment variables
SSH_DIRECTORY="${HOME}/.ssh"
RUN_COMMAND="${HOME}/.${RUN_COMMAND_FILE}"
DEFAULT_RUN_COMMAND="${HOME}/preconfig/Suitcase/bash/configs/default-${RUN_COMMAND_FILE}"
RUN_COMMAND_BACKUP="${HOME}/.${RUN_COMMAND_FILE}.backup"
PRECONFIG_RUN_COMMAND_BACKUP="${HOME}/preconfig/backup/.${RUN_COMMAND_FILE}.backup "
PRECONFIG_BACKUP_DIRECTORY="${HOME}/preconfig/backup"
RUN_COMMAND_TILDE="${HOME}/.${RUN_COMMAND_FILE}~"
SUITCASE_RUN_COMMAND="${HOME}/preconfig/Suitcase/bash/configs/.${RUN_COMMAND_FILE}"

### If .ssh folder does not exist. Create it.
mkdir -p ${SSH_DIRECTORY}

### If .${RUN_COMMAND_FILE} file does not exist. Create it and write content from "default-${RUN_COMMAND_FILE} file to it.
if [ ! -f ${RUN_COMMAND} ]
then
	cp -f ${RUN_COMMAND} ${DEFAULT_RUN_COMMAND}
fi

## If .${RUN_COMMAND_FILE}.backup file in in root folder and preconfig/backup/.${RUN_COMMAND_FILE}.backup folder does not exist. Create it 
if [ ! -f ${RUN_COMMAND_BACKUP} ] && [ ! -f ${PRECONFIG_RUN_COMMAND_BACKUP} ]
then
	cp -f ${RUN_COMMAND} ${RUN_COMMAND_BACKUP}
fi

## If .${RUN_COMMAND_FILE}~ exist. Delete it 
rm -rf ${RUN_COMMAND_TILDE}

mv -f ${RUN_COMMAND} ${RUN_COMMAND_TILDE}

sed '/^alias/d' ${RUN_COMMAND_TILDE} | sed '/^$/d' | sed '/^##/d' | tee ${RUN_COMMAND}

## If preconfig/backup folder does not exist. Create it 
mkdir -p ${PRECONFIG_BACKUP_DIRECTORY}

## If .${RUN_COMMAND_FILE}.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f ${PRECONFIG_RUN_COMMAND_BACKUP} ]
then
	mv -f ${RUN_COMMAND_BACKUP} ${PRECONFIG_RUN_COMMAND_BACKUP}
fi
## If .${RUN_COMMAND_FILE}.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
rm -rf ${RUN_COMMAND_BACKUP}

cat ${SUITCASE_RUN_COMMAND} | tee -a ${RUN_COMMAND} ; clear ; source ${RUN_COMMAND}

set +x
