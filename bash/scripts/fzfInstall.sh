#!/bin/bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install
sed -i "$ d" ~/.bashrc
sed -i "1s/^/[ -f ~\/.fzf.bash ] \&\& source ~\/.fzf.bash\n/" ~/.bashrc
sed -i "1s/^/export FZF_CTRL_T_OPTS\=\"--preview\='bat --theme\=Dracula --style\=numbers --color\=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down\"\n/" ~/.bashrc
