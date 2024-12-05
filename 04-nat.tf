resource "aws_eip" "tokyo_eip" {
  provider = aws.tokyo
  tags = {
    Name    = "tokyo_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "tokyo_ngw" {
  provider      = aws.tokyo
  allocation_id = aws_eip.tokyo_eip.id
  subnet_id     = aws_subnet.tokyo_pub_subnet_1a.id

  tags = {
    Name    = "tokyo_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.tokyo_igw]
}

resource "aws_eip" "new_york_eip" {
  provider = aws.nvirginia
  tags = {
    Name    = "new_york_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "new_york_ngw" {
  provider      = aws.nvirginia
  allocation_id = aws_eip.new_york_eip.id
  subnet_id     = aws_subnet.new_york_pub_subnet_1a.id

  tags = {
    Name    = "new_york_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.new_york_igw]
}

resource "aws_eip" "london_eip" {
  provider = aws.london
  tags = {
    Name    = "london_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "london_ngw" {
  provider      = aws.london
  allocation_id = aws_eip.london_eip.id
  subnet_id     = aws_subnet.london_pub_subnet_1a.id

  tags = {
    Name    = "london_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.london_igw]
}

resource "aws_eip" "saopaulo_eip" {
  provider = aws.saopaulo
  tags = {
    Name    = "saopaulo_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "saopaulo_ngw" {
  provider      = aws.saopaulo
  allocation_id = aws_eip.saopaulo_eip.id
  subnet_id     = aws_subnet.saopaulo_pub_subnet_1a.id

  tags = {
    Name    = "saopaulo_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.saopaulo_igw]
}

resource "aws_eip" "australia_eip" {
  provider = aws.australia
  tags = {
    Name    = "australia_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "australia_ngw" {
  provider      = aws.australia
  allocation_id = aws_eip.australia_eip.id
  subnet_id     = aws_subnet.australia_pub_subnet_1a.id

  tags = {
    Name    = "australia_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.australia_igw]
}

resource "aws_eip" "hongkong_eip" {
  provider = aws.hongkong
  tags = {
    Name    = "hongkong_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "hongkong_ngw" {
  provider      = aws.hongkong
  allocation_id = aws_eip.hongkong_eip.id
  subnet_id     = aws_subnet.hongkong_pub_subnet_1a.id

  tags = {
    Name    = "hongkong_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.hongkong_igw]
}

resource "aws_eip" "california_eip" {
  provider = aws.california
  tags = {
    Name    = "california_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "california_ngw" {
  provider      = aws.california
  allocation_id = aws_eip.california_eip.id
  subnet_id     = aws_subnet.california_pub_subnet_1a.id

  tags = {
    Name    = "california_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.california_igw]
}
