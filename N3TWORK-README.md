# N3TWORK Customizations

All instances of Vault (stage and prod) are deployed in their own dedicated AWS account.

Vault provisioning is controlled by Terraform and the scripts are located in [https://github.com/N3TWORK/vault-on-aws](https://github.com/N3TWORK/vault-on-aws)

This repository is a fork from an open source repo, [https://github.com/jcolemorrison/vault-on-aws](https://github.com/jcolemorrison/vault-on-aws) with some changes made. Please refer to the documentation that came with the repo to understand the architecture.

The first major change is the terraforming for the VPC and subnets have been disabled and instead the terraform files use a data provider referring to the existing manually provisioned VPC and subnets. The VPC contains two public subnets tagged "visibility:public" and two private subnets tagged "visibility:private". These tags are used by the terraform scripts to import the subnets as data providers.

The second change to the forked repo is that terraform must be run from the `environment_state/<env>` directory, which contains a single terraform script for each environment (e.g stage or prod) that imports the base directory as a module. This allows terraform scripts to be used for provisioning different environment instances within the same AWS account. This environment specific terraform script also supplies the overridden variables for customization.