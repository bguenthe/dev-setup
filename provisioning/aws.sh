#!/usr/bin/env bash

pip install awscli

# Export AWS credentials to env (for use in jenkins docker)
echo "
export AWS_ACCESS_KEY_ID=$(aws configure get default.aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get default.aws_secret_access_key)" >> /home/ubuntu/.bashrc
