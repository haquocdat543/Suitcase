#!/bin/bash

export GRYPE="0.74.0"
cd
wget https://github.com/anchore/grype/releases/download/v${GRYPE}/grype_${GRYPE}_linux_amd64.tar.gz
tar -xvzf grype_${GRYPE}_linux_amd64.tar.gz
mv -f ./grype /usr/local/bin
rm -f CHANGELOG.md
rm -f README.md
rm -f LICENSE
rm -f grype_${GRYPE}_linux_amd64.tar.gz
cd -
