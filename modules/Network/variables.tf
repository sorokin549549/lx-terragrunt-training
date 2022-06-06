variable "env" {
  default = "dev"
}

variable "common_tags" {
  type = map(any)
  default = {
    Owner   = "pavel.sarokin"
    Project = "terraform"
  }
}

variable "allow_ports" {
  description = "List of Ports to open for server"
  type        = list(any)
  default     = ["22", "80", "443", "3000"]
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = "10.0.1.0/24"
}

