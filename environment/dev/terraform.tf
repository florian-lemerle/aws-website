terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  
  backend "s3" {
    bucket         = "it-journey-tf-states-dev"
    key            = "aws-website-dev/terraform.tfstate"
    region         = "eu-west-3"
    use_lockfile   = true
    encrypt        = true
    profile = "dev"
    assume_role = {
      role_arn = "arn:aws:iam::375259955289:role/it-journey-terraform-dev-role"
      session_name = "terraform-dev"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  profile = "dev"
  assume_role {
    role_arn = "arn:aws:iam::375259955289:role/it-journey-terraform-dev-role"
    session_name = "terraform-dev"
  }
}