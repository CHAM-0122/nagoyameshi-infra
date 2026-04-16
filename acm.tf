provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

resource "aws_acm_certificate" "main" {
  provider          = aws.virginia
  domain_name       = "chamcham.blog"
  validation_method = "DNS"

  subject_alternative_names = [
    "dev.chamcham.blog"
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "nagoyameshi-cert"
  }
}