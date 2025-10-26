### using open source module
# module "web_server_sg" {
#     count = length(var.sg_name)
#     source = "terraform-aws-modules/security-group/aws"
#     name  = "${local.common_name}-${var.sg_name[count.index]}"
#     description = "Security group for ${var.sg_name[count.index]}"
#     vpc_id      = data.aws_ssm_parameter.vpc_id.value
#     use_name_prefix = false
# }