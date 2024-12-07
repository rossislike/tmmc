resource "aws_launch_template" "australia_http_lt" {
  provider      = aws.australia
  name          = "australia_http_lt"
  description   = "australia_http_lt"
  image_id      = "ami-0146fc9ad419e2cfd"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/basic_userdata.sh")

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  vpc_security_group_ids = [aws_security_group.australia_sg_lt.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "australia_http_lt"
      Service = var.main_service
      Env     = "dev"
    }
  }
}

# resource "aws_launch_template" "australia_tls_lt" {
#     provider = aws.australia
#     name = "australia_tls_lt"
#     description = "australia_tls_lt"
#     image_id = "ami-0146fc9ad419e2cfd" 
#     instance_type = "t2.micro"
#     user_data = filebase64("${path.module}/basic_userdata")

#     metadata_options {
#       http_endpoint = "enabled"
#       http_put_response_hop_limit = 2
#       http_tokens = "required"
#     }
#     vpc_security_group_ids = [aws_security_group.australia_tls_sg_lt.id]

#     tag_specifications {
#       resource_type = "instance"
#       tags = {
#         Name = "australia_tls_lt"
#         Service = var.main_service
#         Env = "dev"
#       }
#     }
# }
