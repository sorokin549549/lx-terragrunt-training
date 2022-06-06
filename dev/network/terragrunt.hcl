terraform {
  source = "..//modules/Network"
}

include "root" {
  path = find_in_parent_folders()
}


inputs = {
  allow_ports         = [22, 80]
  env                 = "prod"
  public_subnet_cidrs = "10.0.5.0/24"

}



