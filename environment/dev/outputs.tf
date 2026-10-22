output "website_domain" {
  value = module.s3_website.cloudfront_domain_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value = module.s3_website.cloudfront_distribution_id
}