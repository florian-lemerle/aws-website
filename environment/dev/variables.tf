variable "s3_bucket_name" {
  type = string
}

variable "cloudfront_oac_name" {
  type = string
}

variable "cloudfront_oac_description" {
  type = string
}

variable "tags" {
  type = map(any)
}