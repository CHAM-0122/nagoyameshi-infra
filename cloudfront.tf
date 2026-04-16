resource "aws_cloudfront_distribution" "main" {
  enabled             = true
  comment             = "nagoyameshi-cloudfront"
  default_root_object = ""

  origin {
    domain_name = aws_lb.main.dns_name
    origin_id   = "nagoyameshi-alb-origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  aliases = [
    "chamcham.blog",
    "dev.chamcham.blog"
  ]

  default_cache_behavior {
    target_origin_id       = "nagoyameshi-alb-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.main.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = {
    Name = "nagoyameshi-cloudfront"
  }
}