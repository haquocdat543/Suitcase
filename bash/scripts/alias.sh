yum install -y git
apt install -y git
git clone https://github.com/haquocdat543/Suitcase.git ~/preconfig/Suitcase
cd ~/preconfig/Suitcase
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git pull origin main -f
cd -
### If .ssh folder does not exist. Create it.
if [ ! -d ~/.ssh ]
then
	mkdir -f ~/.ssh
fi
### If .bashrc file does not exist. Create it and write content from "default-bashrc file to it.
if [ ! -f ~/.bashrc ]
then
	cp -f ~/preconfig/Suitcase/bash/configs/default-bashrc ~/.bashrc
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

cat ~/preconfig/Suitcase/bash/configs/.bashrc | sudo tee -a ~/.bashrc ; clear ; exec bash
