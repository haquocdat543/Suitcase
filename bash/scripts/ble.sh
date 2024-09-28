#!/bin/bash

# TRIAL without installation

curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
source ble-nightly/ble.sh

# Quick INSTALL to BASHRC (If this doesn't work, please follow Sec 1.3)

curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
bash ble-nightly/ble.sh --install ~/.local/share
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
