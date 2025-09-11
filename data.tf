# generating ami id 
data "aws_ami" "name" {
  most_recent = true
  owners      = ["amazon"]
}

# checking the Avilability-Zones 
data "aws_availability_zones" "names" {
  state = "available"
}

#To get the account details
data "aws_caller_identity" "name" {
}

# get the details of region
data "aws_region" "name" {
}


#Getting the Security group details and id
data "aws_security_group" "name" {
  tags = {
    name = "MySG"
    ENV  = "PROD"
  }
}

#Getting VPC Id
data "aws_vpc" "name" {
  tags = {
    ENV  = "PROD"
    Name = "my-vpc"
  }
}



