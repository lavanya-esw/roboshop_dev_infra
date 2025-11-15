# resource "aws_security_group_rule" "allow_frontend-alb_to_frontend" {
#     type = "ingress"
#     security_group_id = local.security_group_id
#     source_security_group_id = local.source_security_group_id
#     from_port = 80
#     protocol = "tcp"
#     to_port = 80
  
# }

resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# resource "aws_security_group_rule" "backend_alb_bastion" {
#   type              = "ingress"
#   security_group_id = local.backend_security_group_id
#   source_security_group_id = local.bastion_sg_id
#   from_port         = 80
#   protocol          = "tcp"
#   to_port           = 80
# }


resource "aws_security_group_rule" "mongodb_bastion" {
  type = "ingress"
  security_group_id = local.mongodb_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
  
}

resource "aws_security_group_rule" "redis_bastion" {
  type = "ingress"
  security_group_id = local.redis_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
  
}

resource "aws_security_group_rule" "rabbitmq_bastion" {
  type = "ingress"
  security_group_id = local.rabbitmq_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
  
}

resource "aws_security_group_rule" "mqsql_bastion" {
  type = "ingress"
  security_group_id = local.mysql_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
  
}

resource "aws_security_group_rule" "catalogue-bastion" {
  type = "ingress"
  security_group_id = local.catalogue_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
  
}

resource "aws_security_group_rule" "mongodb-catalogue" {
  type = "ingress"
  security_group_id = local.mongodb_security_group_id
  source_security_group_id = local.catalogue_security_group_id
  from_port = 27017
  protocol = "tcp"
  to_port = 27017
  
}

resource "aws_security_group_rule" "mongodb-user" {
  type = "ingress"
  security_group_id = local.mongodb_security_group_id
  source_security_group_id = local.user_security_group_id
  from_port = 27017
  protocol = "tcp"
  to_port = 27017  
}



resource "aws_security_group_rule" "redis-cart" {
  type = "ingress"
  security_group_id = local.redis_security_group_id
  source_security_group_id = local.cart_security_group_id
  from_port = 6379
  protocol = "tcp"
  to_port = 6379 
}

resource "aws_security_group_rule" "redis-user" {
  type = "ingress"
  security_group_id = local.redis_security_group_id
  source_security_group_id = local.user_security_group_id
  from_port = 6379
  protocol = "tcp"
  to_port = 6379 
}

resource "aws_security_group_rule" "catalogue-backend_alb" {
  type = "ingress"
  security_group_id = local.catalogue_security_group_id
  source_security_group_id = local.backend_alb_security_group_id
  from_port = 8080
  protocol = "tcp"
  to_port = 8080
  
}

resource "aws_security_group_rule" "cart-backend_alb" {
  type = "ingress"
  security_group_id = local.cart_security_group_id
  source_security_group_id = local.backend_alb_security_group_id
  from_port = 8080
  protocol = "tcp"
  to_port = 8080
  
}

resource "aws_security_group_rule" "backend-alb-cart" {
  type = "ingress"
  security_group_id = local.backend_alb_security_group_id
  source_security_group_id = local.cart_security_group_id
  from_port = 80
  protocol = "tcp"
  to_port = 80
  
}

resource "aws_security_group_rule" "user-backend_alb" {
  type = "ingress"
  security_group_id = local.user_security_group_id
  source_security_group_id = local.backend_alb_security_group_id
  from_port = 8080
  protocol = "tcp"
  to_port = 8080
  
}

resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  security_group_id = local.backend_alb_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

resource "aws_security_group_rule" "user-bastion" {
  type = "ingress"
  security_group_id = local.user_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

resource "aws_security_group_rule" "cart-bastion" {
  type = "ingress"
  security_group_id = local.cart_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

resource "aws_security_group_rule" "shipping-bastion" {
  type = "ingress"
  security_group_id = local.shipping_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

resource "aws_security_group_rule" "payment-bastion" {
  type = "ingress"
  security_group_id = local.payment_security_group_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

resource "aws_security_group_rule" "mysql_shipping" {
  type              = "ingress"
  security_group_id = local.mysql_security_group_id
  source_security_group_id = local.shipping_security_group_id
  from_port         = 3306
  protocol          = "tcp"
  to_port           = 3306
}

resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  security_group_id = local.backend_alb_security_group_id
  source_security_group_id = local.shipping_security_group_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "shipping_backend_alb" {
  type              = "ingress"
  security_group_id = local.shipping_security_group_id
  source_security_group_id = local.backend_alb_security_group_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "payment-backend-alb" {
  type = "ingress"
  security_group_id = local.payment_security_group_id
  source_security_group_id = local.backend_alb_security_group_id
  from_port = 8080
  protocol = "tcp"
  to_port = 8080  
}

resource "aws_security_group_rule" "rabbitmq-payment" {
  type = "ingress"
  security_group_id = local.rabbitmq_security_group_id
  source_security_group_id = local.payment_security_group_id
  from_port = 5672
  protocol = "tcp"
  to_port = 5672  
}

resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  security_group_id = local.backend_alb_security_group_id
  source_security_group_id = local.payment_security_group_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}


