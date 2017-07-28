#! /usr/bin/env bash

TERRAFORM_VERSION="0.9.11"

echo "Install Terraform"

# download Terraform
curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# download Terraform checksum
curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS > terraform_${TERRAFORM_VERSION}_SHA256SUMS_all

# remove unneeded checksums
grep "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" terraform_${TERRAFORM_VERSION}_SHA256SUMS_all > terraform_${TERRAFORM_VERSION}_SHA256SUMS

# compare checksums
sha256sum --check --strict terraform_${TERRAFORM_VERSION}_SHA256SUMS

# unzip installation files
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip


source /etc/environment
