#!/bin/bash

read -p "Enter loop times [1]: " looptimes
read -p "Enter cmd [pwd]: " cmd
cmd=${cmd:-pwd}

for i in {1..$looptimes}
do
   $cmd
done
