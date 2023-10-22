#!/bin/bash
sudo sed -i 's@alias vi="nvim"@alias vi="vi"@g' ~/.bashrc
clear
sudo exec bash
