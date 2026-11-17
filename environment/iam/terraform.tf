terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  
  backend "s3" {
    bucket         = "it-journey-tf-states-security"
    key            = "security/terraform.tfstate"
    region         = "eu-west-3"
    use_lockfile   = true
    encrypt        = true
    profile = "security"
    assume_role = {
      role_arn = "arn:aws:iam::375259955289:role/terraform-security"
      session_name = "terraform"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  profile = "security"

  assume_role {
    role_arn = "arn:aws:iam::375259955289:role/terraform-security"
    session_name = "terraform"
  }
}