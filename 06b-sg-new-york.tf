resource "aws_security_group" "new_york_sg_lt" { 
    provider = aws.nvirginia
    vpc_id = aws_vpc.new_york_vpc.id
    name = "new_york-sg-lt"
    description = "new_york-sg-lt"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "new_york-sg-lt"
        Service = var.main_service
    }
}

resource "aws_security_group" "new_york_sg_lb" { 
    provider = aws.nvirginia
    vpc_id = aws_vpc.new_york_vpc.id
    name = "new_york-sg-lb"
    description = "new_york-sg-lb"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # ingress { 
    #     from_port = 443
    #     to_port = 443
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"] 
    # }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "new_york-sg-lb"
        Service = var.main_service
    }
}

resource "aws_security_group" "new_york_tls_sg_lt" { 
    provider = aws.nvirginia
    vpc_id = aws_vpc.new_york_vpc.id
    name = "new_york_tls_sg_lt"
    description = "new_york_tls_sg_lt"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "new_york_tls_sg_lt"
        Service = var.main_service
    }
}