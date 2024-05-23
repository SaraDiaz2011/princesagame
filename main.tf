provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "princesakey"
  public_key = file("~/.ssh/princesakey.pub")
}

resource "aws_security_group" "web" {
  name        = "princesa_sg"
  description = "security group para acceso a puertos 22 y 80"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                         = "ami-0e001c9271cf7f3b9"
  instance_type               = "t2.micro"
  key_name                    = "princesakey"
  security_groups             = [aws_security_group.web.name]
  associate_public_ip_address = true
  user_data                   = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2 -y
              echo "este es mi servidor web con TF" > index.html
              sudo cp index.html /var/www/html/index.html
              EOF
}