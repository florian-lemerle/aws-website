module "s3_website" {
  source = "../../modules/s3_website"
  
  s3_bucket_name = var.s3_bucket_name
  cloudfront_oac_name = var.cloudfront_oac_name
  cloudfront_oac_description = var.cloudfront_oac_description
  tags = var.tags
}