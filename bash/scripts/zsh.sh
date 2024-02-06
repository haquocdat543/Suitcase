yum install -y git
apt install -y git
git clone https://github.com/haquocdat543/Suitcase.git ~/preconfig/Suitcase
cd ~/preconfig/Suitcase
git reset --hard HEAD~1
git reset --hard HEAD~1
git reset --hard HEAD~1
git pull origin main -f
cd -
### If .zshrc file does not exist. Create it and write content from "default-zshrc file to it.
if [ ! -f ~/.zshrc ]
then
	cp -f ~/preconfig/Suitcase/bash/default-zshrc ~/.zshrc
fi
## If .zshrc.backup file in in root folder and preconfig/backup/.zshrc.backup folder does not exist. Create it 
if [ ! -f ~/.zshrc.backup ] && [ ! -f ~/preconfig/backup/.zshrc.backup ]
then
	cp -f ~/.zshrc ~/.zshrc.backup 
fi

## If .zshrc~ exist. Delete it 
if [ -f ~/zshrc~ ]
then
	rm -f ~/.zshrc~
fi

mv -f ~/.zshrc ~/.zshrc~

sudo sed '/^alias/d' ~/.zshrc~ | sudo sed '/^$/d' | sudo sed '/^##/d' | sudo tee ~/.zshrc

## If preconfig/backup folder does not exist. Create it 
if [ ! -d ~/preconfig/backup ]
then
	mkdir ~/preconfig/backup 
fi
## If .zshrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f ~/preconfig/backup/.zshrc.backup ]
then
	mv -f ~/.zshrc.backup ~/preconfig/backup/.zshrc.backup 
fi
## If .zshrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ -f ~/.zshrc.backup ]
then
	rm -f ~/.zshrc.backup 
fi

cat ~/preconfig/Suitcase/bash/.bashrc | sudo tee -a ~/.zshrc ; clear ; exec zsh 
