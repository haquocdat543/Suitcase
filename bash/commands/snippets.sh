#!/bin/bash
## If preconfig/snippets folder does not exist. Create it 
if [ ! -d ~/preconfig/snippets ]
then
	mkdir ~/preconfig/snippets
fi

rm -f ~/preconfig/snippets/yaml.snippets && touch ~/preconfig/snippets/yaml.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/yaml.snippets | sudo tee -a ~/preconfig/snippets/yaml.snippets
rm -f ~/preconfig/snippets/snippets.snippets && touch ~/preconfig/snippets/snippets.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/snippets.snippets | sudo tee -a ~/preconfig/snippets/snippets.snippets
rm -f ~/preconfig/snippets/sh.snippets && touch ~/preconfig/snippets/sh.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/sh.snippets | sudo tee -a ~/preconfig/snippets/sh.snippets
rm -f ~/preconfig/snippets/c.snippets && touch ~/preconfig/snippets/c.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/c.snippets | sudo tee -a ~/preconfig/snippets/c.snippets
rm -f ~/preconfig/snippets/all.snippets && touch ~/preconfig/snippets/all.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/all.snippets | sudo tee -a ~/preconfig/snippets/all.snippets
