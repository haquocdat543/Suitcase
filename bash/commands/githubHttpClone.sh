#!/bin/bash

cd
read -p "Enter github username [haquocdat543]: " username
username=${username:-haquocdat543}
read -p "Enter github repo name [Terraform]: " repoName
repoName=${repoName:-Terraform}
gcl https://github.com/$username/$repoName.git
cd -
