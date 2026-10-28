resource "aws_s3_bucket" "this" {
  bucket = var.s3_bucket_name
  force_destroy = true
  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_origin_access_control" "this" {
  name = var.cloudfront_oac_name
  description = var.cloudfront_oac_description
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "this" {
  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
    origin_id = "s3-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
  }

  default_cache_behavior {
    allowed_methods = [ "GET", "HEAD", "OPTIONS" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id = "s3-origin"
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    function_association {
      event_type = "viewer-request"
      function_arn = aws_cloudfront_function.append_index.arn
    }
  viewer_protocol_policy = "redirect-to-https"
  min_ttl = 0
  default_ttl = 3600
  max_ttl = 86400
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  tags = var.tags 
}

resource "aws_cloudfront_function" "append_index" {
  name = "append-index-html"
  runtime = "cloudfront-js-2.0"
  comment = "Append index.html after ending slash for hugo content"
  code = file("${path.module}/function_append_index.js")
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.this.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.this.arn
          }
        }
      }
    ]
  })
}