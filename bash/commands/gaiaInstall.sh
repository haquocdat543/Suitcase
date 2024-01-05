#!/bin/bash

export VER="v14.1.0"
wget https://github.com/cosmos/gaia/releases/download/${VER}/gaiad-${VER}-linux-amd64
mv gaiad-${VER}-linux-amd64 /usr/local/bin/gaiad
chmod +x /usr/local/bin/gaiad
gaiad
