#!/bin/bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
~/.fzf/install
sed -i "$ d" ~/.bashrc
sed -i "1s/^/[ -f ~\/.fzf.bash ] \&\& source ~\/.fzf.bash\n/" ~/.bashrc
