#!/bin/bash

cd
export VER="0.41.0"
wget -O lazygit.tgz https://github.com/jesseduffield/lazygit/releases/download/v${VER}/lazygit_${VER}_Linux_x86_64.tar.gz
tar xvf lazygit.tgz
sudo mv lazygit /usr/local/bin/
rm LICENSE README.md lazygit.tgz
cd -
