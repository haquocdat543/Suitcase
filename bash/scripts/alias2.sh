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
GIT_REMOTE_URL="git@github.com/haquocdat543/Suitcase.git"

DESTINATION_DIRECTORY="${HOME}/Suitcase"

# Clone git suitcase repository
git clone ${GIT_REMOTE_URL} ${DESTINATION_DIRECTORY}

CURRENT_DIRECTORY=$(pwd)
cd ${DESTINATION_DIRECTORY}

git reset --hard HEAD~10
git pull origin main -f

cd ${CURRENT_DIRECTORY}
