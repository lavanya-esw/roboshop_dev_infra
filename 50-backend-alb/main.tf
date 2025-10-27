resource "aws_lb" "backend_alb" {
    name = "${var.project}-${var.environment}-backend-alb"
    internal = true
    load_balancer_type = "application"
    security_groups = [local.security_groups]
    subnets = local.subnets
    enable_deletion_protection = true

    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-backend-alb"
        }
    )
  
}

resource "aws_lb_listener" "backend_alb" {
    load_balancer_arn = aws_lb.backend_alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "fixed-response"
        fixed_response {
          content_type = "text/plain"
          message_body = "I am from backend-alb"
          status_code = "200"
        }

    }

  
}