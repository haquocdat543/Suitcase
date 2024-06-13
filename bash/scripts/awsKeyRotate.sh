#!/bin/bash

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
echo "New Access Key ID: $NEW_ACCESS_KEY"
echo "New Secret Access Key: $NEW_SECRET_KEY"

# Update the AWS CLI configuration file
aws configure set aws_access_key_id $NEW_ACCESS_KEY --profile $AWS_PROFILE
aws configure set aws_secret_access_key $NEW_SECRET_KEY --profile $AWS_PROFILE

# Pause to allow manual confirmation or automate this pause based on your needs
read -p "Press [Enter] key after updating your application with the new access key..."

# Delete the old access key
aws iam delete-access-key --profile $AWS_PROFILE --access-key-id $OLD_ACCESS_KEY

echo "Old access key $OLD_ACCESS_KEY has been deleted."
