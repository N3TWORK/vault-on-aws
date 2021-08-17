#!/bin/bash

# This grabs the encrypted credentials file and decrypts it.

aws --profile vault --region us-east-1 s3 cp s3://vault-prod-20210816231714519900000007/vault_creds_encrypted ./temp/vault_creds_encrypted
aws --profile vault --region us-east-1 kms decrypt --key-id f6803787-d232-4f5a-aeac-db7ced848cb7 --ciphertext-blob fileb://temp/vault_creds_encrypted --output text --query Plaintext | base64 --decode > ./temp/vault_creds_decrypted

echo ""
echo "Vault crednetials decrypted.  Find them at ./temp/vault_creds_decrypted"
echo "----"
echo "Load Balancer DNS Name: vault-20210816231720450000000009-1312653588.us-east-1.elb.amazonaws.com"
echo ""