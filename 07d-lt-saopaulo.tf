resource "aws_launch_template" "saopaulo_http_lt" {
  provider      = aws.saopaulo
  name          = "saopaulo_app"
  description   = "saopaulo_app"
  image_id      = "ami-0c820c196a818d66a"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/basic_userdata.sh")

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  vpc_security_group_ids = [aws_security_group.saopaulo_sg_lt.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "saopaulo_app"
      Service = var.main_service
      Env     = "dev"
    }
  }
}

# resource "aws_launch_template" "saopaulo_tls_lt" {
#     provider = aws.saopaulo
#     name = "saopaulo_tls_lt"
#     description = "saopaulo_tls_lt"
#     image_id = "ami-0c820c196a818d66a" 
#     instance_type = "t2.micro"
#     user_data = filebase64("${path.module}/basic_userdata")

#     metadata_options {
#       http_endpoint = "enabled"
#       http_put_response_hop_limit = 2
#       http_tokens = "required"
#     }
#     vpc_security_group_ids = [aws_security_group.saopaulo_tls_sg_lt.id]

#     tag_specifications {
#       resource_type = "instance"
#       tags = {
#         Name = "saopaulo_tls_lt"
#         Service = var.main_service
#         Env = "dev"
#       }
#     }
# }
