#!/bin/bash

export TERRAGRUNT="v0.55.1"
cd
wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT}/terragrunt_linux_amd64
chmod +x ./terragrunt_linux_amd64
mv ./terragrunt_linux_amd64 /usr/local/bin/terragrunt
cd -
