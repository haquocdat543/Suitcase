#!/bin/bash

# Update and install git for CentOS
yum update -y
yum install -y git

# Update and install git for Ubuntu
apt update -y
apt install -y git

# Update and install git for Archlinux
pacman -Syu --noconfirm
pacman -Sy --noconfirm git

# Set up environment variables
GIT_REMOTE_URL="https://github.com/haquocdat543/Suitcase.git"

DESTINATION_DIRECTORY="${HOME}/Suitcase"

# Clone git suitcase repository
git clone ${GIT_REMOTE_URL} ${DESTINATION_DIRECTORY}

CURRENT_DIRECTORY=$(pwd)
cd ${DESTINATION_DIRECTORY}

git reset --hard HEAD~10
git pull origin main -f

cd ${CURRENT_DIRECTORY}

# Setup environment variables
SSH_DIRECTORY="${HOME}/.ssh"
BASH_RUN_COMMAND="${HOME}/.bashrc"
DEFAULT_BASH_RUN_COMMAND="${HOME}/preconfig/Suitcase/bash/configs/default-bashrc"
BASH_RUN_COMMAND_BACKUP="${HOME}/.bashrc.backup"
PRECONFIG_BASH_RUN_COMMAND_BACKUP="${HOME}/preconfig/backup/.bashrc.backup "
PRECONFIG_BACKUP_DIRECTORY="${HOME}/preconfig/backup"
BASH_RUN_COMMAND_TILDE="${HOME}/.bashrc~"
SUITCASE_BASH_RUN_COMMAND="${HOME}/preconfig/Suitcase/bash/configs/.bashrc"

### If .ssh folder does not exist. Create it.
mkdir -p ${SSH_DIRECTORY}

### If .bashrc file does not exist. Create it and write content from "default-bashrc file to it.
if [ ! -f ${BASH_RUN_COMMAND} ]
then
	cp -f ${BASH_RUN_COMMAND} ${DEFAULT_BASH_RUN_COMMAND}
fi

## If .bashrc.backup file in in root folder and preconfig/backup/.bashrc.backup folder does not exist. Create it 
if [ ! -f ${BASH_RUN_COMMAND_BACKUP} ] && [ ! -f ${PRECONFIG_BASH_RUN_COMMAND_BACKUP} ]
then
	cp -f ${BASH_RUN_COMMAND} ${BASH_RUN_COMMAND_BACKUP}
fi

## If .bashrc~ exist. Delete it 
rm -rf ${BASH_RUN_COMMAND_TILDE}

mv -f ${BASH_RUN_COMMAND} ${BASH_RUN_COMMAND_TILDE}

sed '/^alias/d' ${BASH_RUN_COMMAND_TILDE} | sed '/^$/d' | sed '/^##/d' | tee ${BASH_RUN_COMMAND}

## If preconfig/backup folder does not exist. Create it 
mkdir -p ${PRECONFIG_BACKUP_DIRECTORY}

## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f ${PRECONFIG_BASH_RUN_COMMAND_BACKUP} ]
then
	mv -f ${BASH_RUN_COMMAND_BACKUP} ${PRECONFIG_BASH_RUN_COMMAND_BACKUP}
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
rm -rf ${BASH_RUN_COMMAND_BACKUP}

cat ${SUITCASE_BASH_RUN_COMMAND} | tee -a ${BASH_RUN_COMMAND} ; clear ; source ${BASH_RUN_COMMAND}
