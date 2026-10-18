backend "s3" {
    bucket         = "tf-state-dev"
    key            = "aws-website-dev/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-locks-dev"
    encrypt        = true
  }