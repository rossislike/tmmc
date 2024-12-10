resource "aws_launch_template" "california_http_lt" {
  provider      = aws.california
  name          = "california_app"
  description   = "california_app"
  image_id      = "ami-038bba9a164eb3dc1"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/basic_userdata.sh")

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  vpc_security_group_ids = [aws_security_group.california_sg_lt.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "california_app"
      Service = var.main_service
      Env     = "dev"
    }
  }
}

# resource "aws_launch_template" "california_tls_lt" {
#     provider = aws.california
#     name = "california_tls_lt"
#     description = "california_tls_lt"
#     image_id = "ami-038bba9a164eb3dc1" 
#     instance_type = "t2.micro"
#     user_data = filebase64("${path.module}/basic_userdata")

#     metadata_options {
#       http_endpoint = "enabled"
#       http_put_response_hop_limit = 2
#       http_tokens = "required"
#     }
#     vpc_security_group_ids = [aws_security_group.california_tls_sg_lt.id]

#     tag_specifications {
#       resource_type = "instance"
#       tags = {
#         Name = "california_tls_lt"
#         Service = var.main_service
#         Env = "dev"
#       }
#     }
# }
