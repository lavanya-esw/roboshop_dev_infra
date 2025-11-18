data "aws_cloudfront_cache_policy" "CachingOptimized"{
    name = "Managed-CachingOptimized"
}

data "aws_cloudfront_cache_policy" "CachingDisabled"{
    name = "Managed-CachingDisabled"
}

data "aws_ssm_parameter" "cdncertificate_arn" {
    name = "/${var.project}/${var.environment}/frontend_alb_certificate_arn"
  
}
data "aws_route53_zone" "zone_id" {
  name = "awsdevops.fun" # Note the trailing dot for the FQDN
}