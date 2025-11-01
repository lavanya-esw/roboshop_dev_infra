variable "project"{
    default = "roboshop"
}

variable "environment" {
    default = "dev" 
}

variable "sg_names" {
    default = [
        "mongodb","bastion","redis","rabbitmq","mysql","catalogue"
    ] 
}

