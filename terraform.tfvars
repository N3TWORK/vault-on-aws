# The domain name your SSL/TLS certificate was created for.
domain_name = "stage.vault.n3twork.com"

# The name of your EC2 key pair WITHOUT ".pem" added to it
ec2_key_pair_name = "n3twork-server"

# If you didn't create a named AWS profile, omit this.  Otherwise use the profile you created in early steps.
aws_profile = "vault"

vault_version="1.7.1"

# If you want to scope allowed traffic to specific CIDR blocks
# allowed_traffic_cidr_blocks = ["0.0.0.0/0"] # default value

# If you want to scope allowed traffic to specific IPv6 CIDR blocks
# allowed_traffic_cidr_blocks_ipv6 = ["::/0"] # default value