resource "aws_instance" "catalogue" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]
    subnet_id = local.subnet_id

    tags=merge(
        local.common_tags,
        {
            Name = "${local.common_name}-catalogue"
        }
    )
  
}

resource "terraform_data" "catalogue" {
    triggers_replace = [
        aws_instance.catalogue.id
    ]

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.catalogue.private_ip
    }

    provisioner "file" { 
      source = "./catalogue.sh"
      destination = "/tmp/catalogue.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/catalogue.sh",
            "sudo sh /tmp/catalogue.sh catalogue dev",
            "echo 'connected to catalogue'"]
      
    }
  
}

resource "aws_ec2_instance_state" "catalogue" {
    instance_id = aws_instance.catalogue.id
    state = "stopped"
    depends_on = [ terraform_data.catalogue ]
  
}

resource "aws_ami_from_instance" "catalogue" {
    name = "${local.common_name}-catalogue-ami"
    source_instance_id = aws_instance.catalogue.id
    depends_on = [ aws_ec2_instance_state.catalogue ]
    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-catalogue-ami"
        }
    ) 
}

resource "aws_launch_template" "catalogue" {
    name = "${var.project}-${var.environment}-catalogue"
    image_id = aws_ami_from_instance.catalogue.id
    instance_initiated_shutdown_behavior = "terminate"
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]

    tag_specifications {
      resource_type = "instance"
      tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-catalogue"
        }
      )
    }
    tag_specifications {
      resource_type = "volume"
        tags = merge(
            local.common_tags,
            {
                Name = "${var.project}-${var.environment}-catalogue"
            }
       )

    }
    tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-catalogue"
        }
    ) 
}

resource "aws_lb_target_group" "catalogue" {
    name = "${var.project}-${var.environment}-catalogue"
    port = 8080
    protocol = "HTTP"
    vpc_id = local.vpc_id
    deregistration_delay = 60
    health_check {
      interval = 10
      path = "/health"
      port = 8080
      protocol = "HTTP"
      timeout = 2
      healthy_threshold = 2
      unhealthy_threshold = 2
      matcher = "200-299"
    }
}

resource "aws_autoscaling_group" "catalogue" {
    name = "${var.project}-${var.environment}-catalogue"
    min_size = 1
    max_size = 10
    health_check_grace_period = 100
    health_check_type = "ELB"
    desired_capacity = 1
    target_group_arns = [aws_lb_target_group.catalogue.arn]
    vpc_zone_identifier = local.subnet_ids
    launch_template {
      id = aws_launch_template.catalogue.id
      version = aws_launch_template.catalogue.latest_version
    }
    timeouts {
        delete = "15m"
    }
    dynamic "tag" {
    for_each = merge(
      local.common_tags,
      {
        Name = "${var.project}-${var.environment}-catalogue"
      }
    )
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}  



resource "aws_autoscaling_policy" "cpu_utilization_policy" {
  name                   = "${var.project}-${var.environment}-catalogue"
  autoscaling_group_name = aws_autoscaling_group.catalogue.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 70.0 # Target average CPU utilization at 50%
  }
}



resource "aws_alb_listener_rule" "catalogue" {
    listener_arn = local.backend_alb_listener_arn
    priority = 10

    action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.catalogue.arn
    }
    condition {
        host_header {
        values = ["catalogue.backend-alb-dev.awsdevops.fun"]
        }
    }
}


resource "terraform_data" "catalogue_local" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]
  depends_on = [ aws_autoscaling_policy.catalogue ]
  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${aws_instance.catalogue.id}"
    
  }
}
