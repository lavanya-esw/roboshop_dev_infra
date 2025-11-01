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