#!/bin/bash

cd
read -p "Enter your repo name [Suitcase]: " repoName
repoName=${repoName:-Suitcase}
gcl git@github.com:haquocdat543/$repoName
cd -
