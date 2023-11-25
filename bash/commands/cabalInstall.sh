#!/bin/bash

export VER="3.10.1.0"
cd
wget https://downloads.haskell.org/~cabal/cabal-install-${VER}/cabal-install-${VER}-x86_64-linux-centos7.tar.xz
tar -xvf cabal-install-${VER}-x86_64-linux-centos7.tar.xz
sudo chown root ./cabal
sudo chgrp root ./cabal
sudo chmod 777 ./cabal
mv ./cabal /usr/local/bin/cabal
rm -f cabal-install-${VER}-x86_64-linux-centos7.tar.xz
cd -
