#!/bin/bash

export DELTA_VER="0.16.5"
cd
wget https://github.com/dandavison/delta/releases/download/${DELTA_VER}/delta-${DELTA_VER}-x86_64-unknown-linux-gnu.tar.gz
tar -xvzf delta-${DELTA_VER}-x86_64-unknown-linux-gnu.tar.gz
mv -f ~/delta-${DELTA_VER}-x86_64-unknown-linux-gnu/delta /usr/local/bin
rm -rf delta-${DELTA_VER}-x86_64-unknown-linux-gnu
rm -f delta-${DELTA_VER}-x86_64-unknown-linux-gnu.tar.gz
cd -
