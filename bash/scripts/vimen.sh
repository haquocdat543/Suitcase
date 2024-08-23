#!/bin/bash

sed -i '' 's/alias vim="nvim"/alias vim="vim"/' ${HOME}/.bashrc
source ${HOME}/.bashrc
