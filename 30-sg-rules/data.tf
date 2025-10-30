# data "aws_ssm_parameter" "frontend_sg-id"{
#     name = "/${var.project}/${var.environment}/frontend_sg_id"
# }

# data "aws_ssm_parameter" "frontend_alb_sg-id"{
#     name = "/${var.project}/${var.environment}/frontend_alb_sg_id"
# }

data "aws_ssm_parameter" "bastion_sg-id"{
    name = "/${var.project}/${var.environment}/bastion_sg_id"
}

# data "aws_ssm_parameter" "backend_alb_sg-id"{
#     name = "/${var.project}/${var.environment}/backend_alb_sg_id"
# }

data "aws_ssm_parameter" "mongodb_sg-id"{
    name = "/${var.project}/${var.environment}/mongodb_sg_id"
}

