#!/bin/bash

read -p "Enter your user to copy to [ec2-user]: " username
username=${username:-ec2-user}
cat << EOF | sudo tee -a /home/$username/.bashrc
alias up1='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Suitcase/main/bash/scripts/alias.sh )'
alias eb='exec bash'
EOF
clear
