# outputs.tf

output "vpc_and_subnets_summary" {
  value = <<EOF
The following VPCs have been created along with their corresponding subnets:

1. Region: Tokyo (ap-northeast-1)
   - VPC CIDR: ${var.tokyo_vpc_cidr}
   - VPC ID: ${aws_vpc.tokyo_vpc.id}, Name: tokyo_vpc
   - Public Subnet 1A CIDR: ${var.tokyo_pub_subnet_1a}
   - Public Subnet 1A ID: ${aws_subnet.tokyo_pub_subnet_1a.id}, Name: tokyo_pub_subnet_1a
   - Public Subnet 1C CIDR: ${var.tokyo_pub_subnet_1c}
   - Public Subnet 1C ID: ${aws_subnet.tokyo_pub_subnet_1c.id}, Name: tokyo_pub_subnet_1c
   - Private Subnet 1A CIDR: ${var.tokyo_prv_subnet_1a}
   - Private Subnet 1A ID: ${aws_subnet.tokyo_prv_subnet_1a.id}, Name: tokyo_prv_subnet_1a
   - Private Subnet 1C CIDR: ${var.tokyo_prv_subnet_1c}
   - Private Subnet 1C ID: ${aws_subnet.tokyo_prv_subnet_1c.id}, Name: tokyo_prv_subnet_1c

2. Region: New York (us-east-1)
   - VPC CIDR: ${var.new_york_vpc_cidr}
   - VPC ID: ${aws_vpc.new_york_vpc.id}, Name: new_york_vpc
   - Public Subnet 1A CIDR: ${var.new_york_pub_subnet_1a}
   - Public Subnet 1A ID: ${aws_subnet.new_york_pub_subnet_1a.id}, Name: new_york_pub_subnet_1a
   - Public Subnet 1B CIDR: ${var.new_york_pub_subnet_1b}
   - Public Subnet 1B ID: ${aws_subnet.new_york_pub_subnet_1b.id}, Name: new_york_pub_subnet_1b
   - Private Subnet 1A CIDR: ${var.new_york_prv_subnet_1a}
   - Private Subnet 1A ID: ${aws_subnet.new_york_prv_subnet_1a.id}, Name: new_york_prv_subnet_1a
   - Private Subnet 1B CIDR: ${var.new_york_prv_subnet_1b}
   - Private Subnet 1B ID: ${aws_subnet.new_york_prv_subnet_1b.id}, Name: new_york_prv_subnet_1b

3. Region: London (eu-west-2)
   - VPC CIDR: ${var.london_vpc_cidr}
   - VPC ID: ${aws_vpc.london_vpc.id}, Name: london_vpc
   - Public Subnet 1A CIDR: ${var.london_pub_subnet_1a}
   - Public Subnet 1A ID: ${aws_subnet.london_pub_subnet_1a.id}, Name: london_pub_subnet_1a
   - Public Subnet 1B CIDR: ${var.london_pub_subnet_1b}
   - Public Subnet 1B ID: ${aws_subnet.london_pub_subnet_1b.id}, Name: london_pub_subnet_1b
   - Private Subnet 1A CIDR: ${var.london_prv_subnet_1a}
   - Private Subnet 1A ID: ${aws_subnet.london_prv_subnet_1a.id}, Name: london_prv_subnet_1a
   - Private Subnet 1B CIDR: ${var.london_prv_subnet_1b}
   - Private Subnet 1B ID: ${aws_subnet.london_prv_subnet_1b.id}, Name: london_prv_subnet_1b

4. Region: São Paulo (sa-east-1)
   - VPC CIDR: ${var.saopaulo_vpc_cidr}
   - VPC ID: ${aws_vpc.saopaulo_vpc.id}, Name: saopaulo_vpc
   - Public Subnet 1A CIDR: ${var.saopaulo_pub_subnet_1a}
   - Public Subnet 1A ID: ${aws_subnet.saopaulo_pub_subnet_1a.id}, Name: saopaulo_pub_subnet_1a
   - Public Subnet 1B CIDR: ${var.saopaulo_pub_subnet_1b}
   - Public Subnet 1B ID: ${aws_subnet.saopaulo_pub_subnet_1b.id}, Name: saopaulo_pub_subnet_1b
   - Private Subnet 1A CIDR: ${var.saopaulo_prv_subnet_1a}
   - Private Subnet 1A ID: ${aws_subnet.saopaulo_prv_subnet_1a.id}, Name: saopaulo_prv_subnet_1a
   - Private Subnet 1B CIDR: ${var.saopaulo_prv_subnet_1b}
   - Private Subnet 1B ID: ${aws_subnet.saopaulo_prv_subnet_1b.id}, Name: saopaulo_prv_subnet_1b

5. Region: Australia (ap-southeast-2)
   - VPC CIDR: ${var.australia_vpc_cidr}
   - VPC ID: ${aws_vpc.australia_vpc.id}, Name: australia_vpc
   - Public Subnet 1A CIDR: ${var.australia_pub_subnet_1a}
   - Public Subnet 1A ID: ${aws_subnet.australia_pub_subnet_1a.id}, Name: australia_pub_subnet_1a
   - Public Subnet 1B CIDR: ${var.australia_pub_subnet_1b}
   - Public Subnet 1B ID: ${aws_subnet.australia_pub_subnet_1b.id}, Name: australia_pub_subnet_1b
   - Private Subnet 1A CIDR: ${var.australia_prv_subnet_1a}
   - Private Subnet 1A ID: ${aws_subnet.australia_prv_subnet_1a.id}, Name: australia_prv_subnet_1a
   - Private Subnet 1B CIDR: ${var.australia_prv_subnet_1b}
   - Private Subnet 1B ID: ${aws_subnet.australia_prv_subnet_1b.id}, Name: australia_prv_subnet_1b

6. Region: Hong Kong (ap-east-1)
   - VPC CIDR: ${var.hongkong_vpc_cidr}
   - VPC ID: ${aws_vpc.hongkong_vpc.id}, Name: hongkong_vpc
   - Public Subnet 1A CIDR: ${var.hongkong_pub_subnet_1a}
   - Public Subnet 1A ID: ${aws_subnet.hongkong_pub_subnet_1a.id}, Name: hongkong_pub_subnet_1a
   - Public Subnet 1B CIDR: ${var.hongkong_pub_subnet_1b}
   - Public Subnet 1B ID: ${aws_subnet.hongkong_pub_subnet_1b.id}, Name: hongkong_pub_subnet_1b
   - Private Subnet 1A CIDR: ${var.hongkong_prv_subnet_1a}
   - Private Subnet 1A ID: ${aws_subnet.hongkong_prv_subnet_1a.id}, Name: hongkong_prv_subnet_1a
   - Private Subnet 1B CIDR: ${var.hongkong_prv_subnet_1b}
   - Private Subnet 1B ID: ${aws_subnet.hongkong_prv_subnet_1b.id}, Name: hongkong_prv_subnet_1b

7. Region: California (us-west-1)
   - VPC CIDR: ${var.california_vpc_cidr}
   - VPC ID: ${aws_vpc.california_vpc.id}, Name: california_vpc
   - Public Subnet 1A CIDR: ${var.california_pub_subnet_1a}
   - Public Subnet 1A ID: ${aws_subnet.california_pub_subnet_1a.id}, Name: california_pub_subnet_1a
   - Public Subnet 1B CIDR: ${var.california_pub_subnet_1b}
   - Public Subnet 1B ID: ${aws_subnet.california_pub_subnet_1b.id}, Name: california_pub_subnet_1b
   - Private Subnet 1A CIDR: ${var.california_prv_subnet_1a}
   - Private Subnet 1A ID: ${aws_subnet.california_prv_subnet_1a.id}, Name: california_prv_subnet_1a
   - Private Subnet 1B CIDR: ${var.california_prv_subnet_1b}
   - Private Subnet 1B ID: ${aws_subnet.california_prv_subnet_1b.id}, Name: california_prv_subnet_1b
EOF
}




resource "local_file" "output_text" {
  filename = "terraform_output.txt"
  content  = <<EOT
The following VPCs have been created for the service "${var.main_service}":

- Tokyo:       ${aws_vpc.tokyo_vpc.id}
- New York:    ${aws_vpc.new_york_vpc.id}
- London:      ${aws_vpc.london_vpc.id}
- Sao Paulo:   ${aws_vpc.saopaulo_vpc.id}
- Australia:   ${aws_vpc.australia_vpc.id}
- Hong Kong:   ${aws_vpc.hongkong_vpc.id}
- California:  ${aws_vpc.california_vpc.id}

EOT
}
