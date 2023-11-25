#!/bin/bash

export VER="3.10.1.0"
cd
wget https://downloads.haskell.org/~cabal/cabal-install-${VER}/cabal-install-${VER}-x86_64-linux-centos7.tar.xz
tar -xvf cabal-install-${VER}-x86_64-linux-centos7.tar.xz
mv -f ./cabal /user/local/bin/cabal
rm -f cabal-install-${VER}-x86_64-linux-centos7.tar.xz
cd -
