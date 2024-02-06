#!/bin/bash

mv -f ~/.ssh/id_ed25519 ~/.ssh/id
mv -f ~/.ssh/cad ~/.ssh/id_ed25519 
mv -f ~/.ssh/id ~/.ssh/cad
