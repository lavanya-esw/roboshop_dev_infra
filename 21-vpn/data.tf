data "aws_ami" "vpn" {
    owners           = ["679593333241"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["OpenVPN Access Server Community Image-8fbe3379-63b6-43e8-87bd-0e93fd7be8f3"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_ssm_parameter" "openvpn_sg_id" {
  name = "/${var.project}/${var.environment}/openvpn_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
}

data "aws_route53_zone" "zone_id" {
  name = "awsdevops.fun" # Note the trailing dot for the FQDN
}