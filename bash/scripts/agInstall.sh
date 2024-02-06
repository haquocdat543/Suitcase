#!/bin/bash

cd
yum -y install pkgconfig automake gcc zlib-devel pcre-devel xz-devel
yum -y groupinstall "Development Tools"
yum -y install pcre-devel xz-devel zlib-devel
git clone --depth=1 https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
./build.sh
sudo make install
cd -

