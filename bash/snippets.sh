#!/bin/bash
## If preconfig/snippets folder does not exist. Create it 
if [ ! -d ~/preconfig/snippets ]
then
	mkdir ~/preconfig/snippets
fi

if [ ! -d ~/preconfig/snippets/yaml.snippets ]
then
	touch ~/preconfig/snippets/yaml.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/yaml.snippets | sudo tee -a ~/preconfig/snippets/yaml.snippets
fi
