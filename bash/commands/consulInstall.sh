#!/bin/bash

VER="1.17.0"
wget https://releases.hashicorp.com/consul/${VER}/consul_${VER}_linux_amd64.zip
unzip consul_${VER}_linux_amd64.zip
mv consul /usr/local/bin/
rm -f consul_${VER}_linux_amd64.zip 
rm -rf consul_${VER}_linux_amd64.zip
