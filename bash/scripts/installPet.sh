#!/bin/bash

# clone pet repository and build with go
git clone https://github.com/knqyf263/pet.git ${HOME}/pet
cd ${HOME}/pet
make install
