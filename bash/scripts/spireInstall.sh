#!/bin/bash

export SPIRE="1.9.1"
wget https://github.com/spiffe/spire/releases/download/SPIRE/spire-${SPIRE}-linux-amd64-musl.tar.gz
tar -xvzf spire-${SPIRE}-linux-amd64-musl.tar.gz
cp ./spire-${SPIRE}/bin/* /usr/local/bin
rm -rf ./spire*
