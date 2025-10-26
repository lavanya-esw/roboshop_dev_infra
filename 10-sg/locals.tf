locals {
  common_name = "${var.project}-${var.environment}"
  sg_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = true
  }
}