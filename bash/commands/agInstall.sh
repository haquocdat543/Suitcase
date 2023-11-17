#!/bin/bash

sudo yum install -y pcre-devel
sudo yum install -y xz-devel
sudo yum install -y zlib-devel
cd /usr/local/src
sudo git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
sudo ./build.sh
sudo make install
	


