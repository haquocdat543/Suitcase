#!/bin/bash

export HERMES="v1.8.0"
cd
wget https://github.com/informalsystems/hermes/releases/download/${HERMES}/hermes-${HERMES}-x86_64-unknown-linux-gnu.tar.gz
tar -xvzf hermes-${HERMES}-x86_64-unknown-linux-gnu.tar.gz
mv -f hermes /usr/local/bin
rm -f hermes-${HERMES}-x86_64-unknown-linux-gnu.tar.gz
cd -