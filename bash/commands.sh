#!/bin/bash
touch ~/preconfig/commands/changeDirectory.txt
echo !! > ~/preconfig/commands/changeDirectory.txt
sed 's/md //' ~/preconfig/commands/changeDirectory.txt
sed 's/mkdir //' ~/preconfig/commands/changeDirectory.txt
cd $(cat ~/preconfig/commands/changeDirectory.txt)
rm ~/preconfig/commands/changeDirectory.txt
