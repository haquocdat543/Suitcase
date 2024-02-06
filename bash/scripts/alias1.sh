### If .bashrc file does not exist. Create it and write content from "default-bashrc file to it.
read -p "Enter username [ec2-user]:" username
username=${username:-ec2-user}

if [ ! -f /home/$username/.bashrc ]
then
	touch /home/$username/.bashrc && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/default-bashrc | sudo tee -a /home/$username/.bashrc 
fi
## If .bashrc.backup file in in root folder and preconfig/backup/.bashrc.backup folder does not exist. Create it 
if [ ! -f /home/$username/.bashrc.backup ] && [ ! -f /home/$username/preconfig/backup/.bashrc.backup ]
then
	cp -f /home/$username/.bashrc /home/$username/.bashrc.backup 
fi

## If .bashrc~ exist. Delete it 
if [ -f /home/$username/bashrc~ ]
then
	rm -f /home/$username/.bashrc~
fi

mv -f /home/$username/.bashrc /home/$username/.bashrc~

sudo sed '/^alias/d' /home/$username/.bashrc~ | sudo sed '/^$/d' | sudo sed '/^##/d' | sudo tee /home/$username/.bashrc

## If preconfig folder does not exist. Create it 
if [ ! -d /home/$username/preconfig ]
then
	mkdir /home/$username/preconfig
fi
## If preconfig/scripts folder does not exist. Create it 
if [ ! -d /home/$username/preconfig/scripts ]
then
	mkdir /home/$username/preconfig/scripts
fi

## If preconfig/docs folder does not exist. Create it 
if [ ! -d /home/$username/preconfig/docs ]
then
	mkdir /home/$username/preconfig/docs
fi
## If preconfig/vimconfig folder does not exist. Create it 
if [ ! -d /home/$username/preconfig/vimconfig ]
then
	mkdir /home/$username/preconfig/vimconfig
fi
## If preconfig/gitconfig folder does not exist. Create it 
if [ ! -d /home/$username/preconfig/gitconfig ]
then
	mkdir /home/$username/preconfig/gitconfig 
fi

if [ ! -d /home/$username/preconfig/servicePatch ]
then
	mkdir /home/$username/preconfig/servicePatch
fi

if [ ! -d /home/$username/preconfig/controlplaneCertificate ]
then
	mkdir /home/$username/preconfig/controlplaneCertificate 
fi

## If preconfig/backup folder does not exist. Create it 
if [ ! -d /home/$username/preconfig/backup ]
then
	mkdir /home/$username/preconfig/backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f /home/$username/preconfig/backup/.bashrc.backup ]
then
	mv -f /home/$username/.bashrc.backup /home/$username/preconfig/backup/.bashrc.backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ -f /home/$username/.bashrc.backup ]
then
	rm -f /home/$username/.bashrc.backup 
fi

curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/.bashrc | sudo tee -a /home/$username/.bashrc ; clear ; exec bash
