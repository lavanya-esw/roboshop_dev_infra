variable "project"{
    default = "roboshop"
}

variable "environment" {
    default = "dev" 
}

variable "sg_names" {
    default = [
        "mongodb","redis","bastian","frontend","frontend_alb","backend_alb"
    ] 
}

