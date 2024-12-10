resource "aws_launch_template" "london_app" {
  provider      = aws.london
  name          = "london_app"
  description   = "london_app"
  image_id      = "ami-0c76bd4bd302b30ec"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/basic_userdata.sh")

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  vpc_security_group_ids = [aws_security_group.london_sg_lt.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "london_app"
      Service = var.main_service
      Env     = "dev"
    }
  }
}

# resource "aws_launch_template" "london_tls_lt" {
#     provider = aws.london
#     name = "london_tls_lt"
#     description = "london_tls_lt"
#     image_id = "ami-0c76bd4bd302b30ec" 
#     instance_type = "t2.micro"
#     user_data = filebase64("${path.module}/basic_userdata")

#     metadata_options {
#       http_endpoint = "enabled"
#       http_put_response_hop_limit = 2
#       http_tokens = "required"
#     }
#     vpc_security_group_ids = [aws_security_group.london_tls_sg_lt.id]

#     tag_specifications {
#       resource_type = "instance"
#       tags = {
#         Name = "london_tls_lt"
#         Service = var.main_service
#         Env = "dev"
#       }
#     }
# }
