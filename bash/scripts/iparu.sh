#!/bin/bash

sudo pacman -Syu
sudo pacman -S git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru --version
