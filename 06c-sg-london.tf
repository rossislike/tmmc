resource "aws_security_group" "london_sg_lt" {
  provider    = aws.london
  vpc_id      = aws_vpc.london_vpc.id
  name        = "london-sg-lt"
  description = "london-sg-lt"

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
    Name    = "london-sg-lt"
    Service = var.main_service
  }
}

resource "aws_security_group" "london_sg_lb" {
  provider    = aws.london
  vpc_id      = aws_vpc.london_vpc.id
  name        = "london-sg-lb"
  description = "london-sg-lb"

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
    Name    = "london-sg-lb"
    Service = var.main_service
  }
}

resource "aws_security_group" "london_tls_sg_lt" {
  provider    = aws.london
  vpc_id      = aws_vpc.london_vpc.id
  name        = "london_tls_sg_lt"
  description = "london_tls_sg_lt"

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
    Name    = "london_tls_sg_lt"
    Service = var.main_service
  }
}
