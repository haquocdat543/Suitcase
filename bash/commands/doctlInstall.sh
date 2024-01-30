#!/bin/bash

cd ~
wget https://github.com/digitalocean/doctl/releases/downloáad/v1.101.0/doctl-1.101.0-linux-amd64.tar.gz
tar xf ~/doctl-1.101.0-linux-amd64.tar.gz
sudo mv ~/doctl /usr/local/bin

