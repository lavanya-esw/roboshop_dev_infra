resource "aws_instance" "mongodb" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [ local.mongodb_security_group_id ]
    subnet_id = local.database_subnet_id

    tags=merge(
        local.common_tags,
        {
            Name = "${local.common_name}-mongodb"
        }
    )
  
}
resource "terraform_data" "mongodb" {
    triggers_replace = [
        aws_instance.mongodb.id
    ]
    
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = aws_instance.mongodb.private_ip
    }
    provisioner "file" {
        source = "bootstrap.sh"
        destination = "/tmp/bootstrap.sh"
    }

    provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        # "sudo sh /tmp/bootstrap.sh"
        "sudo sh /tmp/bootstrap.sh mongodb dev",

        "echo 'mongodb conneected'"
    ]
  }
  
}

resource "aws_instance" "redis" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [ local.redis_security_group_id ]
    subnet_id = local.database_subnet_id

    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-redis"
        }
    )
  
}

resource "terraform_data" "redis" {
    triggers_replace = [
        aws_instance.redis.id
    ]
  
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = aws_instance.redis.private_ip
  }

  provisioner "file" {
    source = "./bootstrap.sh"
    destination = "/tmp/bootstrap.sh" 
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh redis dev",
        "echo 'redis connected'"
      ]
    
  }
}

resource "aws_instance" "rabbitmq" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [ local.rabbitmq_security_group_id ]
    subnet_id = local.database_subnet_id

    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-rabbitmq"
        }
    )
  
}

resource "terraform_data" "rabbitmq" {
    triggers_replace = [
        aws_instance.rabbitmq.id
    ]
  
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = aws_instance.rabbitmq.private_ip
  }

  provisioner "file" {
    source = "./bootstrap.sh"
    destination = "/tmp/bootstrap.sh" 
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh rabbitmq dev",
        "echo 'rabbitmq connected'"
      ]
    
  }
}

resource "aws_instance" "mysql" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [ local.mysql_security_group_id ]
    subnet_id = local.database_subnet_id
    iam_instance_profile = aws_iam_instance_profile.mysql.name

    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-mysql"
        }
    )
  
}

resource "aws_iam_instance_profile" "mysql" {
    name = "mysql"
    role = "EC2SSMParameterRead"
  
}

resource "terraform_data" "mysql" {
    triggers_replace = [
        aws_instance.mysql.id
    ]

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.mysql.private_ip
    }

    provisioner "file" {
        source = "./bootstrap.sh"
        destination = "/tmp/bootstrap.sh"
      
    }

    provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh mysql dev",
        "echo 'mysql connected'"
      ]
    
  }
}

# route-53 records

resource "aws_route53_record" "mongodb" {
    zone_id = local.zone_id
    name = "mongodb-${var.environment}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [ aws_instance.mongodb.private_ip ]
    allow_overwrite = true
  
}

resource "aws_route53_record" "redis" {
    zone_id = local.zone_id
    name = "redis-${var.environment}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [ aws_instance.redis.private_ip ]
    allow_overwrite = true
  
}
  

  resource "aws_route53_record" "mysql" {
    zone_id = local.zone_id
    name = "mysql-${var.environment}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [ aws_instance.mysql.private_ip ]
    allow_overwrite = true
  
}

resource "aws_route53_record" "rabbitmq" {
    zone_id = local.zone_id
    name = "rabbitmq-${var.environment}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [ aws_instance.rabbitmq.private_ip ]
    allow_overwrite = true
  
}
  
