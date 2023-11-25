#!/bin/bash

cd
read -p "Enter your username [haquocdat543]: " username
username=${username:-haquocdat543}
read -p "Enter your repo name [Suitcase]: " repoName
repoName=${repoName:-Suitcase}
gcl git@github.com:$username/$repoName
cd -
