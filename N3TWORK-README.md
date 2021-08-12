

# Script for obtaining root token and recovery keys
```
#!/bin/bash

# This grabs the encrypted credentials file and decrypts it.

aws --profile vault --region us-east-1 s3 cp s3://vault-deployment-20210716194421673300000002/vault_creds_encrypted ./temp/vault_creds_encrypted
aws --profile vault --region us-east-1 kms decrypt --key-id 4a6fc9ba-6ad1-4c6e-ad45-6c6c8d207538 --ciphertext-blob fileb://temp/vault_creds_encrypted --output text --query Plaintext | base64 --decode > ./temp/vault_creds_decrypted

echo ""
echo "Vault crednetials decrypted.  Find them at ./temp/vault_creds_decrypted"
echo "----"
echo "Load Balancer DNS Name: vault-2021071619445251320000000f-1921562087.us-east-1.elb.amazonaws.com"
echo ""
```
