resource "aws_iam_policy" "it_journey_dev_policy" {
  name = "it-journey-dev-policy"
  path = "/"
  description = "Policy to allow admin access to s3 bucket and cloudFront for dev environement of it-journey"
  tags = {
    Author = "Florian Le Merle"
    Managed_by = "Terraform"
    Environment = "Dev"
    }

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowScopedS3BucketOperations",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "arn:aws:s3:::it-journey-bucket-dev"
        },
        {
            "Sid": "AllowScopedS3ObjectOperations",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::it-journey-bucket-dev/*"
        },
        {
            "Sid": "AllowCloudFrontManagement",
            "Effect": "Allow",
            "Action": [
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
                "cloudfront:DeleteOriginAccessControl"
            ],
            "Resource": "*"
        }
    ]
  })
}

resource "aws_iam_policy" "it_journey_prod_policy" {
  name = "it-journey-prod-policy"
  path = "/"
  description = "Policy to allow admin access to s3 bucket and cloudFront for prod environment of it-journey"
  tags = {
    Author = "Florian Le Merle"
    Managed_by = "Terraform"
    Environment = "Prod"
    }

    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowScopedS3BucketOperations",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "arn:aws:s3:::it-journey-bucket-prod"
        },
        {
            "Sid": "AllowScopedS3ObjectOperations",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::it-journey-bucket-prod/*"
        },
        {
            "Sid": "AllowCloudFrontManagement",
            "Effect": "Allow",
            "Action": [
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
                "cloudfront:DeleteOriginAccessControl"
            ],
            "Resource": "*"
        }
    ]
  })
}