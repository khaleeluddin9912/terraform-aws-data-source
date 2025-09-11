terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


data "aws_ami" "name" {
    most_recent = true
    owners = ["amazon"]
}

output "aws_ami" {
    value = data.aws_ami.name.id
}


resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.name.id
  instance_type = "t2.micro"

  tags = {
    Name = "MyFirstInstance"
  }
  
}


data "aws_availability_zones" "available" {
  state = "available"
}

output "available_zones" {
  value = data.aws_availability_zones.available.names
}




data "aws_caller_identity" "current" {
}

output "caller_info" {
  value = data.aws_caller_identity.current

}
