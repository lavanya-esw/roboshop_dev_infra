locals {
  ami_id = data.aws_ami.joindevops.id
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
  database_subnet_id = split("," , data.aws_ssm_parameter.database_subnet_id.value)[0]
  common_name = "${var.project}-${var.environment}"
  common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}