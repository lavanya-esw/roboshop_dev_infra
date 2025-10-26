### using open source module
# module "web_server_sg" {
#     count = length(var.sg_name)
#     source = "terraform-aws-modules/security-group/aws"
#     name  = "${local.common_name}-${var.sg_name[count.index]}"
#     description = "Security group for ${var.sg_name[count.index]}"
#     vpc_id      = data.aws_ssm_parameter.vpc_id.value
#     use_name_prefix = false
# }

# using customized module
module "sg" {
    count = length(var.sg_names)
    source = "git::https://github.com/lavanya-esw/terraform-aws-sg.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = "${var.project}-${var.environment}-${var.sg_names[count.index]}"
    description = "created for ${var.sg_names[count.index]}"
    vpc_id = local.vpc_id
    sg_tags = local.sg_tags
}