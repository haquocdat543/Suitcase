#!/bin/bash

export VER="455.0.0"
cd
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${VER}-linux-x86_64.tar.gz
tar -xf google-cloud-cli-${VER}-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
./google-cloud-sdk/install.sh --help
./google-cloud-sdk/bin/gcloud init
rm -f google-cloud-cli-${VER}-linux-x86_64.tar.gz
rm -rf google-cloud-sdk
cd -
