


output "aws_ami" {
  value = data.aws_ami.name.id
}

output "aws_zones" {
  value = data.aws_availability_zones.names
}

output "caller_info" {
  value = data.aws_caller_identity.name
}

output "security_group" {
  value = data.aws_security_group.name.id
}

output "vpc_id" {
  value = data.aws_vpc.name.id
}

output "region_name" {
  value = data.aws_region.name
}
