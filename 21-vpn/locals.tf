locals {
  ami = data.aws_ami.vpn.id
  openvpn_sg_id = data.aws_ssm_parameter.openvpn_sg_id.value
  public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
  zone_id = data.aws_route53_zone.zone_id.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}