resource "aws_subnet" "australia_pub_subnet_1a" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = var.australia_pub_subnet_1a
  availability_zone = var.australia_availability_zone_1

  tags = {
    Name    = "australia_pub_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "australia_pub_subnet_1b" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = var.australia_pub_subnet_1b
  availability_zone = var.australia_availability_zone_2

  tags = {
    Name    = "australia_pub_subnet_1b"
    Service = var.main_service
  }
}

resource "aws_subnet" "australia_prv_subnet_1a" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = var.australia_prv_subnet_1a
  availability_zone = var.australia_availability_zone_1

  tags = {
    Name    = "australia_prv_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "australia_prv_subnet_1b" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = var.australia_prv_subnet_1b
  availability_zone = var.australia_availability_zone_2

  tags = {
    Name    = "australia_prv_subnet_1b"
    Service = var.main_service
  }
}