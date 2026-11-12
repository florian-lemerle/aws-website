variable "environment" {
  type = string
  description = "Environment (dev, prod)"
}

variable "terraform_account_name" {
  type = string
  description = "Account used by terraform"
}

variable "cloudfront_distribution_id" {
  type = string
  description = "Cloudfront Distribution ID"
  default = "ChangeMeAfterCloudfrontCreation"
}