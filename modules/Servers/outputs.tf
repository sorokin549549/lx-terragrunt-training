output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu_20-04.id
}

output "latest_ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu_20-04.name
}
