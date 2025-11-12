resource "aws_ssm_parameter" "frontend-alb-certificate-arn" {
    name  = "/${var.project}/${var.environment}/frontend_alb_certificate_arn"
    type = "String"
    value = aws_acm_certificate.roboshop.arn
  
}