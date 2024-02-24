yum update -y
yum install sudo -y
yum install -y git
apt update -y
apt install -y git
pacman -Syu --noconfirm
pacman -Sy --noconfirm git
git clone https://github.com/haquocdat543/Suitcase.git $HOME/preconfig/Suitcase
cd $HOME/preconfig/Suitcase
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
if [ ! -d $HOME/.ssh ]
then
	mkdir -f $HOME/.ssh
fi
### If .bashrc file does not exist. Create it and write content from "default-bashrc file to it.
if [ ! -f $HOME/.bashrc ]
then
	cp -f $HOME/preconfig/Suitcase/bash/configs/default-bashrc $HOME/.bashrc
fi
## If .bashrc.backup file in in root folder and preconfig/backup/.bashrc.backup folder does not exist. Create it 
if [ ! -f $HOME/.bashrc.backup ] && [ ! -f $HOME/preconfig/backup/.bashrc.backup ]
then
	cp -f $HOME/.bashrc $HOME/.bashrc.backup 
fi

## If .bashrc~ exist. Delete it 
if [ -f $HOME/bashrc~ ]
then
	rm -f $HOME/.bashrc~
fi

mv -f $HOME/.bashrc $HOME/.bashrc~

sed '/^alias/d' $HOME/.bashrc~ | sed '/^$/d' | sed '/^##/d' | tee $HOME/.bashrc

## If preconfig/backup folder does not exist. Create it 
if [ ! -d $HOME/preconfig/backup ]
then
	mkdir $HOME/preconfig/backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f $HOME/preconfig/backup/.bashrc.backup ]
then
	mv -f $HOME/.bashrc.backup $HOME/preconfig/backup/.bashrc.backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ -f $HOME/.bashrc.backup ]
then
	rm -f $HOME/.bashrc.backup 
fi

cat $HOME/preconfig/Suitcase/bash/configs/.bashrc | tee -a $HOME/.bashrc ; clear ; source $HOME/.bashrc
