resource "aws_security_group" "saopaulo_sg_lt" { 
    provider = aws.saopaulo
    vpc_id = aws_vpc.saopaulo_vpc.id
    name = "saopaulo-sg-lt"
    description = "saopaulo-sg-lt"

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
        Name = "saopaulo-sg-lt"
        Service = var.main_service
    }
}
