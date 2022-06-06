remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "sorokin-test-bucket-for-terraform"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
   
  }
}

# generate "remote_state" {
#   path      = "backend.tf"
#   if_exists = "overwrite_terragrunt"
#   contents = <<EOF
# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io" # Change this to your hostname for TFE
#     organization = "example-org-5f109b"
#     workspaces {
#       name = "terragrunt-test"
#     }
#   }
# }
# EOF
# }


generate "my_config" {
  path      = "config.tf"
  if_exists = "overwrite"

  contents = <<EOF
provider "aws" {
  region  = var.aws_region

}
variable "aws_region" {
  description = "AWS Region."
}  
EOF
}

locals {
  aws_region        = "eu-west-2"  
}

inputs = {
  aws_region        = local.aws_region
}