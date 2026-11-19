output "terraform_dev_access_key_id" {
  description = "Output of the access key of the terraform service account"
  value = module.iam_dev.terraform_access_key_id
}

output "terraform_dev_access_key_secret" {
  description = "Output of the access key of the terraform service account"
  value = module.iam_dev.terraform_access_key_secret
  sensitive = true
}

output "terraform_prod_access_key_id" {
  description = "Output of the access key of the terraform service account"
  value = module.iam_prod.terraform_access_key_id
}

output "terraform_prod_access_key_secret" {
  description = "Output of the access key of the terraform service account"
  value = module.iam_prod.terraform_access_key_secret
  sensitive = true
}

output "it_journey_dev_tf_role" {
  description = "Arn of the role used by Terraform"
  value = module.iam_dev.it_journey_tf_role_arn
}

output "it_journey_prod_tf_role" {
  description = "Arn of the role used by Terraform"
  value = module.iam_prod.it_journey_tf_role_arn
}

output "it_journey_prod_github_role_arn" {
  value = module.iam_prod.it_journey_github_role_arn
  description = "ARN of the role used to allow github actions"
}

output "it_journey_dev_github_role_arn" {
  value = module.iam_dev.it_journey_github_role_arn
  description = "ARN of the role used to allow github actions"
}