#!/bin/bash

read -p "Enter your stack-name [default]:" stackname
stackname=${stackname:-default}
read -p "Enter your stack-file path [k8s.yaml]:" stackfilepath
stackfilepath=${stackfilepath:-k8s.yaml}
aws cloudformation deploy --stack-name $stackname --stack-file $stackfilepath

