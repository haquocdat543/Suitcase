#!/bin/bash
####	RECREATE FILE AND FOLDER	####
## If preconfig/commands/snippets.sh file exist. Delete and recreate it 
##	rm -f ~/preconfig/commands/snippets.sh && touch ~/preconfig/commands/snippets.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/commands/snippets.sh | sudo tee -a ~/preconfig/commands/snippets.sh 
####	FIX FILE AND FOLDER	####
## If preconfig/docs/dock8s.md file exist. Delete and recreate it 
if [ ! -f ~/preconfig/docs/dock8s.md ]
then
  touch ~/preconfig/docs/dock8s.md && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/docs/dock8s.md | sudo tee -a ~/preconfig/docs/dock8s.md 
fi
