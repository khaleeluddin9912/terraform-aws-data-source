
# creating vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
   tags = {
     Name = "mku_vpc_01"
   }
}

# creating public subnet 
resource "aws_subnet" "my_public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public-subnet"
  }
}

# creating private subnet
resource "aws_subnet" "my_private_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private-subnet"
  }

}

# creating internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_igw_01"
  }
}

# creating route table 
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# association of route table
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id = aws_subnet.my_private_subnet.id
  route_table_id = aws_route_table.my_rt.id
}

#Security group
resource "aws_security_group" "my_sg" {
    name        = "my_sg"
    description = "Allow SSH and HTTP"
    vpc_id      = aws_vpc.my_vpc.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
