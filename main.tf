resource "aws_instance" "web" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = 70136 
  vpc_security_group_ids = [aws_security_group.uma-sg.id]

  tags = {
    Name = "WebApp-terraform"
  }
}

# before to create private aws_security_group
resource "aws_instance" "web-private" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = 70136
  vpc_security_group_ids = [aws_security_group.uma-sg.id]
  associate_public_ip_address = false

   tags = {
    Name = "database"
  }
}
