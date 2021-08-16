data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_vpc" "vault" {
  id = var.vpc_id
}

data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id
  tags = {
    visibility = "private"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = var.vpc_id
  tags = {
    visibility = "public"
  }
}