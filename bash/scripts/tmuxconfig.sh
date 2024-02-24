#!/bin/bash
yum install -y tmux
apt install -y tmux
if [ ! -d ~/.tmux ]
then
	mkdir ~/.tmux
fi
if [ ! -d ~/.tmux/plugins ]
then
	mkdir ~/.tmux/plugins
fi
if [ ! -f ~/.tmux/plugins/tpm ]
then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

### This is configuration for .tmux file
## If the run.sh file in preconfig folder exist. Delete
if [ -f ~/preconfig/tmux.sh ]
then
	rm ~/preconfig/tmux.sh
fi
## If the .tmux file in preconfig folder exist. Delete
if [ -f ~/preconfig/.tmux.conf ]
then
	rm ~/preconfig/.tmux.conf
fi
## Write content to run.sh file in preconfig folder
cat << EOF | tee -a ~/preconfig/tmux.sh
#!/bin/bash

## If pretmux already exist. Delete it
if [ -f ~/preconfig/pretmux ]
then
	rm ~/preconfig/pretmux
fi

## If .tmux in root foleder does not exist. Create it
if [ ! -f ~/.tmux.conf ]
then
	touch ~/.tmux.conf
fi

## If .tmux.backup does not exist. Create it
if [ ! -f ~/preconfig/backup/.tmux.conf.backup ]
then
	cp ~/.tmux.conf ~/preconfig/backup/.tmux.conf.backup 
fi
## move .tmux to pretmux file in preconfig folder
mv ~/.tmux.conf ~/preconfig/pretmux

## move .tmux in preconfig folder to root folder
mv ~/preconfig/.tmux.conf ~/.tmux.conf

EOF
## Write content to .tmux file in preconfig folder
cat ~/preconfig/Suitcase/bash/configs/.tmux.conf | tee -a ~/preconfig/.tmux.conf ; clear
