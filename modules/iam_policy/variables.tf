variable "environment" {
  type = string
  description = "Environment (dev, prod)"
}

variable "cloudfront_distribution_id" {
  type = string
  description = "Cloudfront Distribution ID"
  default = "ChangeMeAfterCloudfrontCreation"
}