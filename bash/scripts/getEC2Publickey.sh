#!/bin/bash

KEY_NAME=$1

aws ec2 describe-key-pairs --key-names $KEY_NAME --include-public-key
