#!/bin/bash
####	RECREATE FILE AND FOLDER	####
## If preconfig/commands/snippets.sh file exist. Delete and recreate it 
	rm -f ~/preconfig/commands/snippets.sh && touch ~/preconfig/commands/snippets.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/snippets.sh | sudo tee -a ~/preconfig/commands/snippets.sh 

####	FIX FILE AND FOLDER	####
## If preconfig/commands/lazygit.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/lazygit.sh ]
then
	touch ~/preconfig/commands/lazygit.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/lazygit.sh | sudo tee -a ~/preconfig/commands/lazygit.sh 
fi
## If preconfig/commands/lazydocker.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/lazydocker.sh ]
then
	touch ~/preconfig/commands/lazydocker.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/lazydocker.sh | sudo tee -a ~/preconfig/commands/lazydocker.sh 
fi
## If preconfig/commands/lazykubernetes.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/lazykubernetes.sh ]
then
	touch ~/preconfig/commands/lazykubernetes.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/lazykubernetes.sh | sudo tee -a ~/preconfig/commands/lazykubernetes.sh 
fi
## If preconfig/commands/goInstall.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/goInstall.sh ]
then
	touch ~/preconfig/commands/goInstall.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/goInstall.sh | sudo tee -a ~/preconfig/commands/goInstall.sh 
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
## If preconfig/commands/updateAll.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/updateAll.sh ]
then
	touch ~/preconfig/commands/updateAll.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/updateAll.sh | sudo tee -a ~/preconfig/commands/updateAll.sh 
fi
## If preconfig/commands/scpssh.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/scpssh.sh ]
then
	touch ~/preconfig/commands/scpssh.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/scpssh.sh | sudo tee -a ~/preconfig/commands/scpssh.sh 
fi
## If preconfig/commands/scpkube.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/scpkube.sh ]
then
	touch ~/preconfig/commands/scpkube.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/scpkube.sh | sudo tee -a ~/preconfig/commands/scpkube.sh 
fi
## If preconfig/commands/kubectl.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/kubectl.sh ]
then
	touch ~/preconfig/commands/kubectl.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/kubectl.sh | sudo tee -a ~/preconfig/commands/kubectl.sh 
fi
## If preconfig/commands/ripgrep.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/ripgrep.sh ]
then
	touch ~/preconfig/commands/ripgrep.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/ripgrep.sh | sudo tee -a ~/preconfig/commands/ripgrep.sh 
fi
## If preconfig/commands/k9s.sh file exist. Delete and recreate it 
if [ ! -f ~/preconfig/commands/k9s.sh ]
then
	touch ~/preconfig/commands/k9s.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/k9s.sh | sudo tee -a ~/preconfig/commands/k9s.sh 
fi
if [ ! -f ~/preconfig/commands/zellijInstall.sh ]
then
	touch ~/preconfig/commands/zellijInstall.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/zellijInstall.sh | sudo tee -a ~/preconfig/commands/zellijInstall.sh 
fi
if [ ! -f ~/preconfig/commands/connect.sh ]
then
	touch ~/preconfig/commands/connect.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/connect.sh | sudo tee -a ~/preconfig/commands/connect.sh 
fi
if [ ! -f ~/preconfig/commands/clean.sh ]
then
	touch ~/preconfig/commands/clean.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/clean.sh | sudo tee -a ~/preconfig/commands/clean.sh 
fi
if [ ! -f ~/preconfig/commands/cmd.sh ]
then
	touch ~/preconfig/commands/cmd.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/cmd.sh | sudo tee -a ~/preconfig/commands/cmd.sh 
fi
if [ ! -f ~/preconfig/commands/copyroot.sh ]
then
	touch ~/preconfig/commands/copyroot.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/copyroot.sh | sudo tee -a ~/preconfig/commands/copyroot.sh 
fi
if [ ! -f ~/preconfig/commands/eksctlInstall.sh ]
then
	touch ~/preconfig/commands/eksctlInstall.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/eksctlInstall.sh | sudo tee -a ~/preconfig/commands/eksctlInstall.sh 
fi
if [ ! -f ~/preconfig/commands/kubectlInstall.sh ]
then
	touch ~/preconfig/commands/kubectlInstall.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/kubectlInstall.sh | sudo tee -a ~/preconfig/commands/kubectlInstall.sh 
fi
if [ ! -f ~/preconfig/commands/clmDeploy.sh ]
then
	touch ~/preconfig/commands/clmDeploy.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/clmDeploy.sh | sudo tee -a ~/preconfig/commands/clmDeploy.sh 
fi
if [ ! -f ~/preconfig/commands/rds.sh ]
then
	touch ~/preconfig/commands/rds.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/rds.sh | sudo tee -a ~/preconfig/commands/rds.sh 
fi
if [ ! -f ~/preconfig/commands/elasticache.sh ]
then
	touch ~/preconfig/commands/elasticache.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/elasticache.sh | sudo tee -a ~/preconfig/commands/elasticache.sh 
fi
