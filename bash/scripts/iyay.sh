#!/bin/bash

sudo pacman -Syu
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
