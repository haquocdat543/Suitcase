#!/bin/bash

mkdir /tmp/etcd && cd /tmp/etcd
rm -rf etcd*
curl -s https://api.github.com/repos/etcd-io/etcd/releases/latest \
  | grep browser_download_url \
  | grep linux-amd64 \
  | cut -d '"' -f 4 \
  | wget -i -
tar xvf etcd-v*.tar.gz
cd etcd-*/
sudo mv etcd* /usr/local/bin/
cd ..
rm -rf etcd*

