terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  
  backend "s3" {
    bucket         = "it-journey-tf-states-prod"
    key            = "aws-website-prod/terraform.tfstate"
    region         = "eu-west-3"
    use_lockfile   = true
    encrypt        = true
    profile = "prod"
    assume_role = {
      role_arn = "arn:aws:iam::375259955289:role/it-journey-terraform-prod-role"
      session_name = "terraform-prod"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  profile = "prod"
  assume_role {
    role_arn = "arn:aws:iam::375259955289:role/it-journey-terraform-prod-role"
    session_name = "terraform-prod"
  }
}