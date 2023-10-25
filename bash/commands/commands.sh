#!/bin/bash
####	RECREATE FILE AND FOLDER	####
## If preconfig/commands/snippets.sh file exist. Delete and recreate it 
	rm -f ~/preconfig/commands/snippets.sh && touch ~/preconfig/commands/snippets.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/snippets.sh | sudo tee -a ~/preconfig/commands/snippets.sh 

####	FIX FILE AND FOLDER	####
## If preconfig/commands/lazygit.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/lazygit.sh ]
then
	touch ~/preconfig/commands/lazygit.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/lazygit.sh | sudo tee -a ~/preconfig/commands/lazygit.sh 
fi
## If preconfig/commands/goInstall.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/goInstall.sh ]
then
	touch ~/preconfig/commands/goInstall.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/goInstall.sh | sudo tee -a ~/preconfig/commands/goInstall.sh 
fi

## If preconfig/gitconfig/gitPushOriginMain.sh file does not exist. Create it 
if [ ! -f ~/preconfig/gitconfig/gitPushOriginMain.sh ]
then
	touch  ~/preconfig/gitconfig/gitPushOriginMain.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/gitPushOriginMain.sh | sudo tee -a ~/preconfig/gitconfig/gitPushOriginMain.sh  
fi

## If preconfig/servicePatch/nodePort.sh file does not exist. Create it 
if [ ! -f ~/preconfig/servicePatch/nodePort.sh ]
then
	touch  ~/preconfig/servicePatch/nodePort.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/servicePatch/nodePort.sh | sudo tee -a ~/preconfig/servicePatch/nodePort.sh  
fi

## If preconfig/servicePatch/loadBalancer.sh file does not exist. Create it 
if [ ! -f ~/preconfig/servicePatch/loadBalancer.sh ]
then
	touch  ~/preconfig/servicePatch/loadBalancer.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/servicePatch/loadBalancer.sh | sudo tee -a ~/preconfig/servicePatch/loadBalancer.sh  
fi

## If preconfig/servicePatch/clusterIP.sh file does not exist. Create it 
if [ ! -f ~/preconfig/servicePatch/clusterIP.sh ]
then
	touch  ~/preconfig/servicePatch/clusterIP.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/servicePatch/clusterIP.sh | sudo tee -a ~/preconfig/servicePatch/clusterIP.sh  
fi

if [ ! -f ~/preconfig/controlplaneCertificate/controlplaneCertificate.sh ]
then
	touch  ~/preconfig/controlplaneCertificate/controlplaneCertificate.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/controlplaneCertificate/controlplaneCertificate.sh | sudo tee -a ~/preconfig/controlplaneCertificate/controlplaneCertificate.sh  
fi

if [ ! -f ~/preconfig/vimconfig/nvimen.sh ]
then
	touch  ~/preconfig/vimconfig/nvimen.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/vimconfig/nvimen.sh | sudo tee -a ~/preconfig/vimconfig/nvimen.sh  
fi

if [ ! -f ~/preconfig/vimconfig/vimen.sh ]
then
	touch  ~/preconfig/vimconfig/vimen.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/vimconfig/vimen.sh | sudo tee -a ~/preconfig/vimconfig/vimen.sh  
fi
