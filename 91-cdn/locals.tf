locals {
    CachingDisabled = data.aws_cloudfront_cache_policy.CachingDisabled.id
    CachingOptimized = data.aws_cloudfront_cache_policy.CachingOptimized.id
    cdncertificate_arn = data.aws_ssm_parameter.cdncertificate_arn.value
    zone_id = data.aws_route53_zone.zone_id.id

    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
  
}