output "it_journey_prod_github_role_arn" {
  value = module.iam_prod.it_journey_github_role_arn
  description = "ARN of the role used to allow github actions"
}

output "it_journey_dev_github_role_arn" {
  value = module.iam_dev.it_journey_github_role_arn
  description = "ARN of the role used to allow github actions"
}