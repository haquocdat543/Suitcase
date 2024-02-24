#!/bin/bash

### This is configuration for init.vim file
## If the nvim.sh file in preconfig folder exist. Delete
if [ ! -d ~/.config ]
then
	mkdir ~/.config	
fi

if [ ! -d ~/.config/nvim ]
then
	mkdir ~/.config/nvim
fi

if [ -f ~/preconfig/nvim.sh ]
then
	rm ~/preconfig/nvim.sh
fi
## If the init.vim file in preconfig folder exist. Delete
if [ -f ~/preconfig/init.vim ]
then
	rm ~/preconfig/init.vim
fi
## Write content to nvim.sh file in preconfig folder
cat << EOF | tee -a ~/preconfig/nvim.sh
#!/bin/bash

## If previmrc already exist. Delete it
if [ -f ~/preconfig/previmrc ]
then
	rm ~/preconfig/previmrc
fi

## If init.vim in root foleder does not exist. Create it
if [ ! -f ~/.config/nvim/init.vim ]
then
	touch ~/.config/nvim/init.vim
fi

## If init.vim.backup does not exist. Create it
if [ ! -f ~/preconfig/backup/init.vim.backup ]
then
	cp ~/.config/nvim/init.vim ~/preconfig/backup/init.vim.backup 
fi
## move init.vim to previmrc file in preconfig folder
mv ~/.config/nvim/init.vim ~/preconfig/previmrc

## move init.vim in preconfig folder to root folder
mv ~/preconfig/init.vim ~/.config/nvim/init.vim

EOF
## Write content to init.vim file in preconfig folder
cat ~/preconfig/Suitcase/bash/configs/init.vim | tee -a ~/preconfig/init.vim ; clear

