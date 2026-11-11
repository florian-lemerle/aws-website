output "website_domain" {
  value = module.s3_website.cloudfront_domain_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value = module.s3_website.cloudfront_distribution_id
}

output "s3_bucket_name" {
  description = "S3 Bucket name"
  value = module.s3_website.s3_bucket_name
}