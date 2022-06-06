terraform {
  # source = "git::git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git//.?ref=v4.0.0"
  source = "../../modules//Servers"
}

include "root" {
  path = find_in_parent_folders()
  expose = true
}

dependency "network" {
  config_path                             = "../network/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"] 
  mock_outputs = {
    public_subnets = ["subnet-fake"]
    aws_security_group = ["sg-fake"]
  }
}

inputs = {
  

   enviroment         = "dev"
  # ami                    = "ami-0b0c271bc281923cc"
  instance_type      = "t3.nano"

  subnet_id              = dependency.network.outputs.public_subnets[0]
  vpc_security_group_ids = [dependency.network.outputs.aws_security_group]
  

}


