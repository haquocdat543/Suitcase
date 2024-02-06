#!/bin/bash

cd
wget https://download.redis.io/redis-stable.tar.gz
tar -xzvf redis-stable.tar.gz
cd redis-stable
make
sudo make install
cd ..
rm -f redis-stable.tar.gz
