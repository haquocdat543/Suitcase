#!/bin/bash

export VER="v1.31.2"
cd
curl -L https://github.com/kubernetes/kompose/releases/download/${VER}/kompose-linux-amd64 -o kompose
chmod +x ./kompose
mv ./kompose /usr/local/bin
cd -
