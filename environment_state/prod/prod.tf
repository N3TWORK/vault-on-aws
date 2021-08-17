provider "aws" {
  region = "us-east-1"
  profile = "platform"
}

module "vault" {
  source = "./../.."
  domain_name = "prod.vault.n3twork.com"
  ec2_key_pair_name = "n3twork-server"
  aws_profile = "vault"
  vault_version = "1.7.1"
  main_project_tag = "vault-prod"
  dynamodb_table_name = "vault_prod_storage"
  vpc_id = "vpc-068e9f8d29b3c62cc"
}