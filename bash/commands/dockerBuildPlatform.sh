#!/bin/bash

read -p "Enter your image name [haquocdat543/vuev3:latest]: " imageName
imageName=${imageName:-haquocdat543/vuev3:latest}
read -p "Enter you platform [linux/amd64]: " platform
platform=${platform:-linux/amd64}
docker build -f Dockerfile . -t $imageName --platform=$platform
