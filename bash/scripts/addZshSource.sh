#!/bin/bash

cat << EOF | sudo tee -a ~/.zshrc
source ~/preconfig/Suitcase/bash/.bashrc
EOF
