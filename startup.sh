#!/bin/sh

rm -rf .terraform
terraform --version
terraform init \
    -backend-config "access_key=$TF_VAR_access_key" \
    -backend-config "secret_key=$TF_VAR_secret_key" \
    -backend-config "bucket=terraform-tf-state" \
    -backend-config "key=$TF_VAR_namespace-create_namespace_user" \
    -backend-config "region=main"

# if [[ $(terraform workspace list | grep 'production' | wc -l ) = 0 ]]; then
#   terraform workspace new production
# fi
# terraform workspace select production
