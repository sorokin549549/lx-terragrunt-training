terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

data "aws_ami" "latest_ubuntu_20-04" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "ubuntu_20-04" {
  count                  = 1
  ami                    = data.aws_ami.latest_ubuntu_20-04.id
  instance_type          = var.instance_type
  tags                   = { "Name" = "${var.enviroment}-ec2-by-${var.common_tags.Owner}" }
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

}

