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
rm -f ~/preconfig/snippets/cpp.snippets && touch ~/preconfig/snippets/cpp.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/cpp.snippets | sudo tee -a ~/preconfig/snippets/cpp.snippets
rm -f ~/preconfig/snippets/html.snippets && touch ~/preconfig/snippets/html.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/html.snippets | sudo tee -a ~/preconfig/snippets/html.snippets
rm -f ~/preconfig/snippets/js.snippets && touch ~/preconfig/snippets/js.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/js.snippets | sudo tee -a ~/preconfig/snippets/js.snippets
rm -f ~/preconfig/snippets/css.snippets && touch ~/preconfig/snippets/css.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/css.snippets | sudo tee -a ~/preconfig/snippets/css.snippets
rm -f ~/preconfig/snippets/vue.snippets && touch ~/preconfig/snippets/vue.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/vue.snippets | sudo tee -a ~/preconfig/snippets/vue.snippets
rm -f ~/preconfig/snippets/json.snippets && touch ~/preconfig/snippets/json.snippets && curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/snippets/json.snippets | sudo tee -a ~/preconfig/snippets/json.snippets
