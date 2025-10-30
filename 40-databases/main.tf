resource "aws_instance" "mongodb" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [ local.security_group_id ]
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



    provisioner "remote-exec" {

    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = aws_instance.mongodb.private_ip
    }

        inline = [ 
            "echo i am in mongodb"
         ]
      
    }
  
}