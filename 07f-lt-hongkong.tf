resource "aws_launch_template" "hongkong_http_lt" {
  provider      = aws.hongkong
  name          = "hongkong_http_lt"
  description   = "hongkong_http_lt"
  image_id      = "ami-06f707739f2271995"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/basic_userdata.sh")

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  vpc_security_group_ids = [aws_security_group.hongkong_sg_lt.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "hongkong_http_lt"
      Service = var.main_service
      Env     = "dev"
    }
  }
}

# resource "aws_launch_template" "hongkong_tls_lt" {
#     provider = aws.hongkong
#     name = "hongkong_tls_lt"
#     description = "hong_kong_tls_lt"
#     image_id = "ami-06f707739f2271995" 
#     instance_type = "t2.micro"
#     user_data = filebase64("${path.module}/basic_userdata")

#     metadata_options {
#       http_endpoint = "enabled"
#       http_put_response_hop_limit = 2
#       http_tokens = "required"
#     }
#     vpc_security_group_ids = [aws_security_group.hong_kong_tls_sg_lt.id]

#     tag_specifications {
#       resource_type = "instance"
#       tags = {
#         Name = "hongkong_tls_lt"
#         Service = var.main_service
#         Env = "dev"
#       }
#     }
# }
