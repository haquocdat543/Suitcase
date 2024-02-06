#!/bin/bash

export PULUMI="3.101.0"
cd
wget https://get.pulumi.com/releases/sdk/pulumi-v${PULUMI}-linux-x64.tar.gz
tar -xvzf pulumi-v${PULUMI}-linux-x64.tar.gz
cp ./pulumi/* /usr/local/bin
rm -rf ./pulumi
rm -f ./pulumi-v${PULUMI}-linux-x64.tar.gz
cd -
