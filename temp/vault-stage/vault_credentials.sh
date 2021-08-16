#!/bin/bash

# This grabs the encrypted credentials file and decrypts it.

aws --profile vault --region us-east-1 s3 cp s3://vault-stage-20210813010056224200000007/vault_creds_encrypted ./temp/vault_creds_encrypted
aws --profile vault --region us-east-1 kms decrypt --key-id 4a822b89-1f73-405e-afc1-2fcc0f563fda --ciphertext-blob fileb://temp/vault_creds_encrypted --output text --query Plaintext | base64 --decode > ./temp/vault_creds_decrypted

echo ""
echo "Vault crednetials decrypted.  Find them at ./temp/vault_creds_decrypted"
echo "----"
echo "Load Balancer DNS Name: vault-20210813231323339200000009-1049458251.us-east-1.elb.amazonaws.com"
echo ""