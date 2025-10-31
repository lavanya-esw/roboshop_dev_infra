resource "aws_instance" "main" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.bastion_sg_id]
    subnet_id = local.public_subnet_id
    user_data = file("${path.module}/bastion.sh")

    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-bastian"
        }
    )
   }


  
