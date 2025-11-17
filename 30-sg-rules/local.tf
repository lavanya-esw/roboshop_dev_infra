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
  frontend_sg_id = data.aws_ssm_parameter.frontend_sg-id.value
  openvpn_sg_id = data.aws_ssm_parameter.openvpn_sg_id.value

  vpn_ingress_rules = {
    mongodb_22 = {
      sg_id = local.mongodb_security_group_id
      port = 22
    }
    mysql_22 = {
      sg_id = local.mysql_security_group_id
      port = 22
    }
    redis_22 = {
      sg_id = local.redis_security_group_id
      port = 22
    }
    rabbitmq_22 = {
      sg_id = local.rabbitmq_security_group_id
      port = 22
    }
    catalogue = {
        sg_id = local.catalogue_security_group_id
        port = 22
    }
    catalogue_8080 = {
        sg_id = local.catalogue_security_group_id
        port = 8080
    }
    user = {
        sg_id = local.user_security_group_id
        port = 22
    }
    cart = {
        sg_id = local.cart_security_group_id
        port = 22
    }
    shipping = {
        sg_id = local.shipping_security_group_id
        port = 22
    }
    payment = {
        sg_id = local.payment_security_group_id
        port = 22
    }
    frontend = {
        sg_id = local.frontend_sg_id
        port = 22
    }
    backend_alb = {
        sg_id = local.backend_alb_security_group_id
        port = 80
    }
  }

}