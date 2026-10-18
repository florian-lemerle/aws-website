output "website_domain" {
  value = module.s3_website.cloudfront_domain_name
}