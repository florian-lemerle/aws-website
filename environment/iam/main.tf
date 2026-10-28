module "iam_dev" {
  source = "../../modules/iam_policy"
  environment = "dev"
  terraform_account_name = "svc_terraform_dev"
}

module "iam_prod" {
  source = "../../modules/iam_policy"
  environment = "prod"
  terraform_account_name = "svc_terraform_prod"
}