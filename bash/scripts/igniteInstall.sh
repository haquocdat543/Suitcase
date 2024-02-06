#!/bin/bash

cd
git clone https://github.com/ignite/cli --depth=1
cd cli && makáe install
cp -f ~/go/bin/ignite /usr/local/bin
