#!/bin/bash
sudo sed -i 's@alias vi="vi"@alias vi="nvim"@g' ~/.bashrc
clear
exec bash
