### If .bashrc file does not exist. Create it and write content from "default-bashrc file to it.
if [ ! -f /home/ec2-user/.bashrc ]
then
	touch /home/ec2-user/.bashrc && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/default-bashrc | sudo tee -a /home/ec2-user/.bashrc 
fi
## If .bashrc.backup file in in root folder and preconfig/backup/.bashrc.backup folder does not exist. Create it 
if [ ! -f /home/ec2-user/.bashrc.backup ] && [ ! -f /home/ec2-user/preconfig/backup/.bashrc.backup ]
then
	cp -f /home/ec2-user/.bashrc /home/ec2-user/.bashrc.backup 
fi

## If .bashrc~ exist. Delete it 
if [ -f /home/ec2-user/bashrc~ ]
then
	rm -f /home/ec2-user/.bashrc~
fi

mv -f /home/ec2-user/.bashrc /home/ec2-user/.bashrc~

sudo sed '/^alias/d' /home/ec2-user/.bashrc~ | sudo sed '/^$/d' | sudo sed '/^##/d' | sudo tee /home/ec2-user/.bashrc

## If preconfig folder does not exist. Create it 
if [ ! -d /home/ec2-user/preconfig ]
then
	mkdir /home/ec2-user/preconfig
fi
## If preconfig/commands folder does not exist. Create it 
if [ ! -d /home/ec2-user/preconfig/commands ]
then
	mkdir /home/ec2-user/preconfig/commands
fi

## If preconfig/docs folder does not exist. Create it 
if [ ! -d /home/ec2-user/preconfig/docs ]
then
	mkdir /home/ec2-user/preconfig/docs
fi
## If preconfig/vimconfig folder does not exist. Create it 
if [ ! -d /home/ec2-user/preconfig/vimconfig ]
then
	mkdir /home/ec2-user/preconfig/vimconfig
fi
## If preconfig/gitconfig folder does not exist. Create it 
if [ ! -d /home/ec2-user/preconfig/gitconfig ]
then
	mkdir /home/ec2-user/preconfig/gitconfig 
fi

if [ ! -d /home/ec2-user/preconfig/servicePatch ]
then
	mkdir /home/ec2-user/preconfig/servicePatch
fi

if [ ! -d /home/ec2-user/preconfig/controlplaneCertificate ]
then
	mkdir /home/ec2-user/preconfig/controlplaneCertificate 
fi

## If preconfig/backup folder does not exist. Create it 
if [ ! -d /home/ec2-user/preconfig/backup ]
then
	mkdir /home/ec2-user/preconfig/backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f /home/ec2-user/preconfig/backup/.bashrc.backup ]
then
	mv -f /home/ec2-user/.bashrc.backup /home/ec2-user/preconfig/backup/.bashrc.backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ -f /home/ec2-user/.bashrc.backup ]
then
	rm -f /home/ec2-user/.bashrc.backup 
fi

curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/.bashrc | sudo tee -a /home/ec2-user/.bashrc ; clear ; exec bash
