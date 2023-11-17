#!/bin/bash

sudo yum install -y pcre-devel
sudo yum install -y xz-devel
sudo yum install -y zlib-devel
sudo yum install -y automake
sudo yum install -y make
sudo yum install -y gcc
cd /usr/local/src
sudo git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
sudo ./build.sh
sudo make install
cp -f /usr/local/src/the_silver_searcher/ag /usr/local/bin/ag
cd -

