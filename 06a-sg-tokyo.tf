resource "aws_security_group" "tokyo_sg_lt" {
  provider    = aws.tokyo
  vpc_id      = aws_vpc.tokyo_vpc.id
  name        = "tokyo-sg-lt"
  description = "tokyo-sg-lt"

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
    Name    = "tokyo-sg-lt"
    Service = var.main_service
  }
}

resource "aws_security_group" "tokyo_sg_lb" {
  provider    = aws.tokyo
  vpc_id      = aws_vpc.tokyo_vpc.id
  name        = "tokyo-sg-lb"
  description = "tokyo-sg-lb"

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
    Name    = "tokyo-sg-lb"
    Service = var.main_service
  }
}

resource "aws_security_group" "tokyo_tls_sg_lt" {
  provider    = aws.tokyo
  vpc_id      = aws_vpc.tokyo_vpc.id
  name        = "tokyo_tls_sg_lt"
  description = "tokyo_tls_sg_lt"

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
    Name    = "tokyo_tls_sg_lt"
    Service = var.main_service
  }
}