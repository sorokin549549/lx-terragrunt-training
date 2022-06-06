
output "vpc_id" {
  value = [aws_vpc.main.id, aws_vpc.main.default_security_group_id]
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "aws_security_group" {
  value = aws_security_group.main.id
}

output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}
