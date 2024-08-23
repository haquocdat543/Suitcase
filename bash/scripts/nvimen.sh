#!/bin/bash

sed -i '' 's/alias vim="vim"/alias vim="nvim"/' ${HOME}/.bashrc
source ${HOME}/.bashrc
