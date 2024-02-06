#!/bin/bash

### This is configuration for init.lua file
## If the lua.sh file in preconfig folder exist. Delete
if [ -f ~/preconfig/lua.sh ]
then
	rm ~/preconfig/lua.sh
fi
## If the init.lua file in preconfig folder exist. Delete
if [ -f ~/preconfig/init.lua ]
then
	rm ~/preconfig/init.lua
fi
## Write content to lua.sh file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/lua.sh
#!/bin/bash

## If preinit.lua already exist. Delete it
if [ -f ~/preconfig/preinit.lua ]
then
	rm ~/preconfig/preinit.lua
fi

## If init.lua in root foleder does not exist. Create it
if [ ! -f ~/.config/nvim/init.lua ]
then
	touch ~/.config/nvim/init.lua
fi

## If init.lua.backup does not exist. Create it
if [ ! -f ~/preconfig/backup/init.lua.backup ]
then
	cp ~/.config/nvim/init.lua ~/preconfig/backup/init.lua.backup 
fi
## move init.lua to preinit.lua file in preconfig folder
mv ~/.config/nvim/init.lua ~/preconfig/preinit.lua

## move init.lua in preconfig folder to root folder
mv ~/preconfig/init.lua ~/.config/nvim/init.lua

EOF
## Write content to init.lua file in preconfig folder
cat ~/preconfig/Suitcase/bash/configs/init.lua | sudo tee -a ~/preconfig/init.lua ; clear

