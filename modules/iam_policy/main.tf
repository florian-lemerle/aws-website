data "aws_iam_policy_document" "tf_backend" {
  statement {
    sid     = "AllowStateBucketAccess"
    effect  = "Allow"
    actions = ["s3:ListBucket"]
    resources = [
      "arn:aws:s3:::it-journey-tf-states-${var.environment}"
    ]
  }
  statement {
    sid     = "AllowStateObjectAccess"
    effect  = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::it-journey-tf-states-${var.environment}/*"
    ]
  }

  statement {
    sid     = "AllowDynamoDBLocking"
    effect  = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [
      "arn:aws:dynamodb:*:*:table/it-journey-tf-locks-${var.environment}"
    ]
  }
}

data "aws_iam_policy_document" "it_journey" {
  statement {
    sid       = "AllowScopedS3BucketOperations"
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["arn:aws:s3:::it-journey-bucket-${var.environment}"]
  }

  statement {
    sid     = "AllowScopedS3ObjectOperations"
    effect  = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion"
    ]
    resources = ["arn:aws:s3:::it-journey-bucket-${var.environment}/*"]
  }

  statement {
    sid     = "AllowCloudFrontManagement"
    effect  = "Allow"
    actions = [
      "cloudfront:CreateDistribution",
      "cloudfront:GetDistribution",
      "cloudfront:UpdateDistribution",
      "cloudfront:DeleteDistribution",
      "cloudfront:TagResource",
      "cloudfront:UntagResource",
      "cloudfront:ListTagsForResource",
      "cloudfront:CreateOriginAccessControl",
      "cloudfront:GetOriginAccessControl",
      "cloudfront:UpdateOriginAccessControl",
      "cloudfront:DeleteOriginAccessControl",
      "cloudfront:CreateFunction",
      "cloudfront:PublishFunction",
      "cloudfront:DescribeFunction",
      "cloudfront:GetFunction",
      "cloudfront:DeleteFunction",
      "cloudfront:UpdateFunction"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "github_actions" {
  statement {
    sid = "AllowS3BucketAccess"
    effect= "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::it-journey-bucket-${var.environment}",
      "arn:aws:s3:::it-journey-bucket-${var.environment}/*"
    ]
  }

  statement {
    sid = "AllowCloudFrontInvalidation"
    effect = "Allow"
    actions = ["cloudfront:CreateInvalidation"]
    resources = ["arn:aws:cloudfront::375259955289:distribution/E3Y70JKYCSVL"]
  }
  
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    
    principals {
      type = "Federated"
      identifiers = ["arn:aws:iam::375259955289:oidc-provider/token.actions.githubusercontent.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        var.environment == "prod" ?
        "repo:florian-lemerle@272038517/it-journey@1404512070:ref:refs/heads/prod" :
        "repo:florian-lemerle@272038517/it-journey@1404512070:ref:refs/heads/test"
      ]

    }
  }
}

resource "aws_iam_policy" "tf_backend" {
  name        = "terraform-backend-policy-${var.environment}"
  description = "IAM policy for Terraform state and locking in ${var.environment}"
  policy      = data.aws_iam_policy_document.tf_backend.json
  tags = {
    Author      = "Florian Le Merle"
    Managed_by  = "Terraform"
  }
}

resource "aws_iam_policy" "it_journey" {
  name        = "it-journey-${var.environment}-policy"
  path        = "/"
  description = "Policy to allow admin access to s3 bucket and cloudFront for ${var.environment} environement of it-journey"
  policy = data.aws_iam_policy_document.it_journey.json
  tags = {
    Author      = "Florian Le Merle"
    Managed_by  = "Terraform"
  }
}

resource "aws_iam_policy" "github_actions" {
  name = "it-journey-github-${var.environment}-policy"
  path = "/"
  description = "Policy to allow github actions to push content to s3 bucket."
  policy = data.aws_iam_policy_document.github_actions.json
  tags = {
    Author = "Florian Le Merle"
    Managed_by = "Terraform"
  }
}

resource "aws_iam_user_policy_attachment" "tf_backend" {
  user = var.terraform_account_name
  policy_arn = aws_iam_policy.tf_backend.arn
}

resource "aws_iam_user_policy_attachment" "it-journey" {
  user = var.terraform_account_name
  policy_arn = aws_iam_policy.it_journey.arn
}

resource "aws_iam_role" "it_journey_github_role" {
  name = "it-journey-github-${var.environment}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "it_journey_github_role_policy" {
 role = aws_iam_role.it_journey_github_role.name
 policy_arn = aws_iam_policy.github_actions.arn
}