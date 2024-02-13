#!/bin/bash

export HK3S="v1.1.5"
cd
wget https://github.com/vitobotta/hetzner-k3s/releases/download/${HK3S}/hetzner-k3s-linux-amd64
chmod +x hetzner-k3s-linux-amd64
sudo mv hetzner-k3s-linux-amd64 /usr/local/bin/hetzner-k3s
cd -
