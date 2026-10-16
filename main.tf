resource "aws_vpc" "qa" {
    cidr_block = var.cidr
    tags = {
      name="my-vpc"
      environment="qa"
    }
  
}

resource "aws_subnet" "qa" {

cidr_block = "10.0.0.0/28"
vpc_id = aws_vpc.qa.id
tags = {
  name="my_subnet"
  environment="qa"
}
  
}

resource "aws_security_group" "qa" {
  name        = "my-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.qa.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  }
resource "aws_instance" "qa" {
  subnet_id = aws_subnet.qa.id
  ami = "ami-0ed59cbb87dfa8dba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.qa.id]
}

resource "aws_vpc" "dev" {
    cidr_block = var.cidr
    tags = {
      name="my-vpc1"
      environment="dev"
    }
  
}

resource "aws_subnet" "dev" {

cidr_block = "10.0.0.0/28"
vpc_id = aws_vpc.dev.id
tags = {
  name="my_subnet-dev"
  environment="dev"
}
  
}

resource "aws_security_group" "dev" {
  name        = "my-security-group-dev"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.dev.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  }
resource "aws_instance" "dev" {
  subnet_id = aws_subnet.dev.id
  ami = "ami-0ed59cbb87dfa8dba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.dev.id]
}