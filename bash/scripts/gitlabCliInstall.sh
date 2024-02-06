#!/bin/bash

VER="1.36.0"
cd
wget https://gitlab.com/gitlab-org/cli/-/releases/v${VER}/downloads/glab_${VER}_Linux_x86_64.tar.gz
tar -xvzf glab_${VER}_Linux_x86_64.tar.gz
cp bin/glab /usr/local/bin
rm -f glab*
cd -
