#!/bin/bash

cd
version=19.0.0
file=vitess-${version}-97fdf78.tar.gz
folder=vitess-${version}-97fdf78
wget https://github.com/vitessio/vitess/releases/download/v${version}/${file}
tar -xzf ${file}
cd $HOME/$folder
sudo mkdir -p /usr/local/vitess/
sudo cp -r * /usr/local/vitess/
rm -rf $HOME/vitess-*
cd -
export PATH="$PATH:/usr/local/vitess/bin"
