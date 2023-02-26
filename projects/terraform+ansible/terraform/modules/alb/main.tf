module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = var.alb_name

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.subnets
  security_groups    = var.security_groups

  target_groups = [
    {
      name_prefix      = var.target_groups_name
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = var.target_type
      targets = {
        target_01 = {
          target_id = var.target_01
          port = 80
        }
        target_02 = {
          target_id = var.target_02
          port = 80
        }
        target_03 = {
          target_id = var.target_03
          port = 80
        }
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.ssl_cert
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Production"
  }
}