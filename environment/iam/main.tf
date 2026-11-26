module "iam_dev" {
  source = "../../modules/iam_policy"
  environment = "dev"
  cloudfront_distribution_id = "E1T1M3GC6UB8KS"
}

module "iam_prod" {
  source = "../../modules/iam_policy"
  environment = "prod"
  cloudfront_distribution_id = "EKYTEHGZEFTEW"
}