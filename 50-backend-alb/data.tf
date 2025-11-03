# data "aws_ssm_parameter" "frontend_sg-id"{
#     name = "/${var.project}/${var.environment}/frontend_sg_id"
# }

data "aws_ssm_parameter" "backend_alb_sg-id"{
    name = "/${var.project}/${var.environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids"{
    name = "/${var.project}/${var.environment}/private_subnet_ids"
}

data "aws_route53_zone" "zone_id" {
  name = "awsdevops.fun" # Note the trailing dot for the FQDN
}
