output "cloudfront_domain_name" {
  description = "Domain name of CloudFront"
  value = aws_cloudfront_distribution.this.domain_name
}