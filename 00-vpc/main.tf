module "vpc"{
    source = "git::https://github.com/lavanya-esw/terraform_aws_vpc.git?ref=main"
    vpc_cidr = var.vpc_cidr
    project_name = var.project
    environment = var.env
    vpc_tags = local.vpc_tags
    gw_tags = local.vpc_tags
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
    subnet_tags = local.vpc_tags
    is_peering_required = true
}