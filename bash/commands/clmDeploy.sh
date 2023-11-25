#!/bin/bash

read -p "Enter your stack-name [default]: " stackname
stackname=${stackname:-default}
read -p "Enter your template-file path [k8s.yaml]: " templatefile
templatefile=${templatefile:-k8s.yaml}
aws cloudformation deploy --stack-name $stackname --template-file $templatefile

