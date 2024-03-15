#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S cairo pango ffmpeg --noconfirm
sudo pacman -S python-pip --noconfirm
pip3 install manim
