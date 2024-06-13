#!/bin/bash

black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
gray='\033[0;37m'
gray2='\033[1;30m'
red2='\033[1;31m'
green2='\033[1;32m'
yellow='\033[1;33m'
blue2='\033[1;34m'
purple2='\033[1;35m'
cyan2='\033[1;36m'
white='\033[1;37m'
nc='\033[0m' # No Color

# Check if a profile name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <aws-profile>"
  exit 1
fi

# Define variables
AWS_PROFILE=$1

# Get the current IAM user ARN
IAM_USER_ARN=$(aws sts get-caller-identity --profile $AWS_PROFILE --query Arn --output text)
IAM_USER_NAME=$(echo $IAM_USER_ARN | cut -d'/' -f2)

# Get the old access key ID
OLD_ACCESS_KEY=$(aws iam list-access-keys --profile $AWS_PROFILE --query 'AccessKeyMetadata[0].AccessKeyId' --output text)

# Create a new access key
NEW_KEY_INFO=$(aws iam create-access-key --profile $AWS_PROFILE)
NEW_ACCESS_KEY=$(echo $NEW_KEY_INFO | jq -r '.AccessKey.AccessKeyId')
NEW_SECRET_KEY=$(echo $NEW_KEY_INFO | jq -r '.AccessKey.SecretAccessKey')

# Output the new access key information
echo -e "New Access Key ID: ${green}$NEW_ACCESS_KEY${nc}"
echo -e "New Secret Access Key: ${green}$NEW_SECRET_KEY${nc}"

# Update the AWS CLI configuration file
aws configure set aws_access_key_id $NEW_ACCESS_KEY --profile $AWS_PROFILE
aws configure set aws_secret_access_key $NEW_SECRET_KEY --profile $AWS_PROFILE

# Pause to allow manual confirmation or automate this pause based on your needs
read -p "Press [Enter] key after updating your application with the new access key..."

# Delete the old access key
aws iam delete-access-key --profile $AWS_PROFILE --access-key-id $OLD_ACCESS_KEY

echo -e "Old access key ${blue}$OLD_ACCESS_KEY${nc} has been deleted."
