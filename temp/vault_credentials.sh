#!/bin/bash

# This grabs the encrypted credentials file and decrypts it.

aws --profile vault --region us-east-1 s3 cp s3://vault-deployment-20210628224656636200000002/vault_creds_encrypted ./temp/vault_creds_encrypted
aws --profile vault --region us-east-1 kms decrypt --key-id 9c02f9e2-76a9-4469-acbe-4e065015aecf --ciphertext-blob fileb://temp/vault_creds_encrypted --output text --query Plaintext | base64 --decode > ./temp/vault_creds_decrypted

echo ""
echo "Vault crednetials decrypted.  Find them at ./temp/vault_creds_decrypted"
echo "----"
echo "Load Balancer DNS Name: vault-2021062822472728170000000f-1579797275.us-east-1.elb.amazonaws.com"
echo ""