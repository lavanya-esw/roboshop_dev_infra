variable "project"{
    default = "roboshop"
}

variable "environment" {
    default = "dev" 
}

variable "sg_name" {
    default = [
        "mongodb"
    ]
  
}
