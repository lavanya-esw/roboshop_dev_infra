locals {
  security_groups = data.aws_ssm_parameter.backend_alb_sg-id.value
  subnets = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
  common_name = "${var.project}-${var.environment}"

  common_tags= {
    Project = var.project
    Environment = var.environment
    Terraform = "True"
  }
}