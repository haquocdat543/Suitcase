#!/bin/bash

wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
tar xvf k9s_Linux_amd64.tar.gz
mv k9s /usr/local/bin/k9s
rm -f k9s_Linux_amd64.tar.gz
k9s --version

