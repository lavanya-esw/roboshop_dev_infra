locals {
    common_name = "${var.project}-${var.environment}"
    common_tags ={
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }

    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
    ami_id = data.aws_ami.joindevops.id
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
    zone_id = data.aws_route53_zone.zone_id.value
}