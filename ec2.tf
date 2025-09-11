resource "aws_instance" "my_instance" {
    ami           = "ami-02d26659fd82cf299"  # Ubuntu Linux
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.my_private_subnet.id
    security_groups = [aws_security_group.my_sg.id]
    tags = {
        Name = "terra_server"
    }
  
}
