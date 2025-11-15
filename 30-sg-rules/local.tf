locals {
  # security_group_id = data.aws_ssm_parameter.frontend_sg-id.value
  # source_security_group_id = data.aws_ssm_parameter.frontend_alb_sg-id.value
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg-id.value
  # backend_security_group_id = data.aws_ssm_parameter.backend_alb_sg-id.value
  mongodb_security_group_id = data.aws_ssm_parameter.mongodb_sg-id.value
  redis_security_group_id = data.aws_ssm_parameter.redis_sg-id.value
  rabbitmq_security_group_id = data.aws_ssm_parameter.rabbitmq_sg-id.value
  mysql_security_group_id = data.aws_ssm_parameter.mysql_sg-id.value
  catalogue_security_group_id = data.aws_ssm_parameter.catalogue_sg-id.value
  backend_alb_security_group_id = data.aws_ssm_parameter.backend-alb_sg-id.value
  frontend_alb_sg_id = data.aws_ssm_parameter.frontend-alb_sg-id.value
  user_security_group_id = data.aws_ssm_parameter.user_sg-id.value
  cart_security_group_id = data.aws_ssm_parameter.cart_sg-id.value
  shipping_security_group_id = data.aws_ssm_parameter.shipping_sg-id.value
  payment_security_group_id = data.aws_ssm_parameter.payment_sg-id.value
  frontend_sg_id = data.aws_ssm_parameter.frontend_sg-id

}