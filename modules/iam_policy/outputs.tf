output "tf_backend_policy_arn" {
  value       = aws_iam_policy.tf_backend.arn
  description = "ARN of the generated backend policy"
}

output "it_journey_policy_arn" {
  value       = aws_iam_policy.it_journey.arn
  description = "ARN of the generated it-journey policy"
}