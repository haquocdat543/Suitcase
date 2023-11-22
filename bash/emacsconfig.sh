#!/bin/bash
yum install emacs -y
apt install emacs -y
### This is configuration for init.el file
## If the emacs.sh file in preconfig folder exist. Delete
if [ -f ~/preconfig/emacs.sh ]
then
	rm ~/preconfig/emacs.sh
fi
## If the init.el file in preconfig folder exist. Delete
if [ -f ~/preconfig/init.el ]
then
	rm ~/preconfig/init.el
fi
## Write content to emacs.sh file in preconfig folder
cat << EOF | sudo tee -a ~/preconfig/emacs.sh
#!/bin/bash

## If preinitel already exist. Delete it
if [ -f ~/preconfig/preinitel ]
then
	rm ~/preconfig/preinitel
fi

## If init.el in root foleder does not exist. Create it
if [ ! -f ~/init.el ]
then
	touch ~/init.el
fi

## If init.el.backup does not exist. Create it
if [ ! -f ~/preconfig/backup/init.el.backup ]
then
	cp ~/init.el ~/preconfig/backup/init.el.backup 
fi
## move init.el to preinitel file in preconfig folder
mv ~/init.el ~/preconfig/preinitel

## move init.el in preconfig folder to root folder
mv ~/preconfig/init.el ~/init.el

EOF
## Write content to init.el file in preconfig folder
cat ~/preconfig/Suitcase/bash/init.el | sudo tee -a ~/preconfig/init.el ; clear
