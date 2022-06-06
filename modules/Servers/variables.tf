variable "enviroment" {
  default = "dev"
}


variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "common_tags" {
  type = map(any)
  default = {
    Owner   = "pavel.sarokin"
    Project = "terraform"
  }

}

variable "subnet_id" {  
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {  
  type        = list(string)
  default     = null
}
