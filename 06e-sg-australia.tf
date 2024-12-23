resource "aws_security_group" "australia_sg_lt" {
  provider    = aws.australia
  vpc_id      = aws_vpc.australia_vpc.id
  name        = "australia-sg-lt"
  description = "australia-sg-lt"

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

  tags = {
    Name    = "australia-sg-lt"
    Service = var.main_service
  }
}

resource "aws_security_group" "australia_sg_lb" {
  provider    = aws.australia
  vpc_id      = aws_vpc.australia_vpc.id
  name        = "australia-sg-lb"
  description = "australia-sg-lb"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress { 
  #     from_port = 443
  #     to_port = 443
  #     protocol = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"] 
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "australia-sg-lb"
    Service = var.main_service
  }
}

resource "aws_security_group" "australia_tls_sg_lt" {
  provider    = aws.australia
  vpc_id      = aws_vpc.australia_vpc.id
  name        = "australia_tls_sg_lt"
  description = "australia_tls_sg_lt"

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

  tags = {
    Name    = "australia_tls_sg_lt"
    Service = var.main_service
  }
}
