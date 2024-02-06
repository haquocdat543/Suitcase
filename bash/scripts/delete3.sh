#!/bin/bash
### This is use for command dall3

### This is configuration for .vimrc file

## Delete .vimrc and .bashrc in root folder 
if [ -f ~/.vimrc ]
then
	sudo rm -f ~/.vimrc
fi

if [ -f ~/.tmux.conf ]
then
	sudo rm -f ~/.tmux.conf
fi

if [ -f ~/.bashrc ]
then
	sudo rm -f ~/.bashrc
fi

if [ -f ~/.ssh/id_ed25519 ]
then
	sudo rm -f ~/.ssh/id_ed25519
fi

## If .vimrc in root folder does not exist. mv it from preconfig/backup folder
if [ ! -f ~/.vimrc ] && [ -f ~/preconfig/backup/.vimrc.backup ]
then
	mv ~/preconfig/backup/.vimrc.backup ~/.vimrc
fi

if [ ! -f ~/.tmux.conf ] && [ -f ~/preconfig/backup/.tmux.conf.backup ]
then
	mv ~/preconfig/backup/.tmux.conf.backup ~/.tmux.conf
fi

## If .bashrc in root folder does not exist. mv it from preconfig/backup folder
if [ ! -f ~/.bashrc ] && [ -f ~/preconfig/backup/.bashrc.backup ]

then
	mv ~/preconfig/backup/.bashrc.backup ~/.bashrc
fi
## Remove preconfig folder and .bashrc~ file
 
rm -rf ~/preconfig
sudo rm -f ~/.bashrc~

## If Terraform folder exist. Delete it
if [ -d ~/Terraform ]
then
	rm -rf ~/Terraform
fi

## If Suitcase folder exist. Delete it
if [ -d ~/Suitcase ]
then
	rm -rf ~/Suitcase
fi

## If ArgoCD folder exist. Delete it
if [ -d ~/ArgoCD ]
then
	rm -rf ~/AgoCD
fi

## If Suitcase folder exist. Delete it
if [ -d ~/Suitcase ]
then
	rm -rf ~/Suitcase
fi

## Clear all alias
exec bash
