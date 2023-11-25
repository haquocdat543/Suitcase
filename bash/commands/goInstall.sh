#!/bin/bash

export VER="1.21.3"
wget https://go.dev/dl/go${VER}.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go${VER}.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
rm -f go${VER}.linux-amd64
go version
