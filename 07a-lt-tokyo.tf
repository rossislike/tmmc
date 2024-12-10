resource "aws_launch_template" "tokyo_app" {
  provider      = aws.tokyo
  name          = "tokyo_app"
  description   = "tokyo_app"
  image_id      = "ami-023ff3d4ab11b2525"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/basic_userdata.sh")

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  vpc_security_group_ids = [aws_security_group.tokyo_sg_lt.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "tokyo_app"
      Service = var.main_service
      Env     = "dev"
    }
  }
}

# resource "aws_launch_template" "tokyo_tls_lt" {
#     provider = aws.tokyo
#     name = "tokyo_tls_lt"
#     description = "tokyo_tls_lt"
#     image_id = "ami-023ff3d4ab11b2525" 
#     instance_type = "t2.micro"
#     user_data = filebase64("${path.module}/basic_userdata")

#     metadata_options {
#       http_endpoint = "enabled"
#       http_put_response_hop_limit = 2
#       http_tokens = "required"
#     }
#     vpc_security_group_ids = [aws_security_group.tokyo_tls_sg_lt.id]

#     tag_specifications {
#       resource_type = "instance"
#       tags = {
#         Name = "tokyo_tls_lt"
#         Service = var.main_service
#         Env = "dev"
#       }
#     }
# }

/*
1. **Tokyo** — `ap-northeast-1` (Asia Pacific - Tokyo)  ami-023ff3d4ab11b2525
2. **New York** — `us-east-1` (US East - N. Virginia)  ami-0453ec754f44f9a4a
3. **London** — `eu-west-2` (Europe - London)  ami-0c76bd4bd302b30ec
4. **Sao Paulo** — `sa-east-1` (South America - São Paulo)  ami-0c820c196a818d66a
5. **Australia** — `ap-southeast-2` (Asia Pacific - Sydney)  ami-0146fc9ad419e2cfd
6. **Hong Kong** — `ap-east-1` (Asia Pacific - Hong Kong)  ami-06f707739f2271995
7. **California** — `us-west-1` (US West - N. California)  ami-038bba9a164eb3dc1
*/