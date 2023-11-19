#!/bin/bash

if [ -f ~/.config/nvim/init.vim ] && [ -f ~/preconfig/init.lua ]
then
	mv -f ~/.config/nvim/init.vim ~/preconfig/init.vim
	mv -f ~/preconfig/init.lua ~/.config/nvim/init.lua
else 
	mv -f ~/.config/nvim/init.lua ~/preconfig/init.lua
	mv -f ~/preconfig/init.vim ~/.config/nvim/init.vim
fi


