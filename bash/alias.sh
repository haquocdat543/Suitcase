### If .bashrc file does not exist. Create it and write content from "default-bashrc file to it.
if [ ! -f ~/.bashrc ]
then
	touch ~/.bashrc && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/default-bashrc | sudo tee -a ~/.bashrc 
fi
## If .bashrc.backup file in in root folder and preconfig/backup/.bashrc.backup folder does not exist. Create it 
if [ ! -f ~/.bashrc.backup ] && [ ! -f ~/preconfig/backup/.bashrc.backup ]
then
	cp -f ~/.bashrc ~/.bashrc.backup 
fi

## If .bashrc~ exist. Delete it 
if [ -f ~/bashrc~ ]
then
	rm -f ~/.bashrc~
fi

mv -f ~/.bashrc ~/.bashrc~

sudo sed '/^alias/d' ~/.bashrc~ | sudo sed '/^$/d' | sudo sed '/^##/d' | sudo tee ~/.bashrc

## If preconfig folder does not exist. Create it 
if [ ! -d ~/preconfig ]
then
	mkdir ~/preconfig
fi
## If preconfig/commands folder does not exist. Create it 
if [ ! -d ~/preconfig/commands ]
then
	mkdir ~/preconfig/commands
fi

## If preconfig/docs folder does not exist. Create it 
if [ ! -d ~/preconfig/docs ]
then
	mkdir ~/preconfig/docs
fi
## If preconfig/vimconfig folder does not exist. Create it 
if [ ! -d ~/preconfig/vimconfig ]
then
	mkdir ~/preconfig/vimconfig
fi
## If preconfig/gitconfig folder does not exist. Create it 
if [ ! -d ~/preconfig/gitconfig ]
then
	mkdir ~/preconfig/gitconfig 
fi

if [ ! -d ~/preconfig/servicePatch ]
then
	mkdir ~/preconfig/servicePatch
fi

if [ ! -d ~/preconfig/controlplaneCertificate ]
then
	mkdir ~/preconfig/controlplaneCertificate 
fi

## If preconfig/backup folder does not exist. Create it 
if [ ! -d ~/preconfig/backup ]
then
	mkdir ~/preconfig/backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f ~/preconfig/backup/.bashrc.backup ]
then
	mv -f ~/.bashrc.backup ~/preconfig/backup/.bashrc.backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ -f ~/.bashrc.backup ]
then
	rm -f ~/.bashrc.backup 
fi

curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/.bashrc | sudo tee -a ~/.bashrc ; clear ; exec bash
