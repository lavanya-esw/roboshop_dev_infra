locals {
  common_name = "${var.project}-${var.environment}"
  common_tags = {
    Project = var.project
    Environment = var.environment
  }
  zone_id = data.aws_route53_zone.zone_id.id
}