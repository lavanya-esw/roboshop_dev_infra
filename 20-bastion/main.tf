resource "aws_instance" "main" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.bastion_sg_id]
    subnet_id = local.public_subnet_id
    user_data = file("${path.module}/bastion.sh")
    # need more for terraform
    root_block_device {
        volume_size = 50
        volume_type = "gp3" # or "gp2", depending on your preference
    }

    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-bastian"
        }
    )
   }


  
