#!/bin/bash

wget https://github.com/yolossn/lazykubernetes/releases/download/v0.1.2/lazykubernetes_Linux_386
sudo install -m 755 lazykubernetes_Linux_386 /usr/local/sbin/lazykubernetes
rm -f lazykubernetes_Linux_386 
