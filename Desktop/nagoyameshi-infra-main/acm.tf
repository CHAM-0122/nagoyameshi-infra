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

resource "aws_acm_certificate" "alb" {
  domain_name       = "chamcham.blog"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_route53_record" "alb_cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.alb.domain_validation_options :
#     dvo.domain_name => {
#       name   = dvo.resource_record_name
#       type   = dvo.resource_record_type
#       record = dvo.resource_record_value
#     }
#   }

#   zone_id = data.aws_route53_zone.main.id
#   name    = each.value.name
#   type    = each.value.type
#   ttl     = 60
#   records = [each.value.record]
# }

# resource "aws_acm_certificate_validation" "alb" {
#   certificate_arn         = aws_acm_certificate.alb.arn
#   validation_record_fqdns = [for record in aws_route53_record.alb_cert_validation : record.fqdn]
# }