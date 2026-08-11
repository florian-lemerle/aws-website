provider "aws" {
  
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "FL-VPC"

  azs = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  
  enable_nat_gateway = true

  tags = var.tags
}