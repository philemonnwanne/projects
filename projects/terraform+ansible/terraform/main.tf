# this file defines the terraform block, which Terraform uses to configures itself

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }
  }
  required_version = ">= 1.1.0"
}

# this block configures the AWS provider
provider "aws" {
  region = local.region
}

# define common tags to be assigned to all VPC resources
locals {
  region = var.aws_region

  tags = {
    Owner = "Philemon Nwanne"
    Track = "Cloud/DevOps"
  }
}

# import the vpc module
module "vpc" {
  source = "./modules/vpc"

  vpc_name = "mini-vpc"
  tags     = local.tags
}

# import the security module
module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.mini_vpc_id
}

# import the ec2 module
module "ec2" {
  source = "./modules/ec2"

  count                  = length(module.vpc.mini_vpc_subnet_id)
  subnet_id              = element("${module.vpc.mini_vpc_subnet_id[*]}", count.index)
  availability_zone      = element("${module.vpc.azs[*]}", count.index)
  vpc_security_group_ids = [module.security.webserver_security_group_id]

  tags = {
    Name        = "${var.instance_name}0${count.index + 1}"
    Environment = "production"
  }
}

# import the alb module
module "alb" {
  source = "./modules/alb"

  vpc_id          = module.vpc.mini_vpc_id
  subnets         = module.vpc.mini_vpc_subnet_id[*]
  security_groups = [module.security.alb_security_group_id]
  target_01       = module.ec2.*.webserver_id[0]
  target_02       = module.ec2.*.webserver_id[1]
  target_03       = module.ec2.*.webserver_id[2]
}

# import the route53 module
module "route53" {
  source = "./modules/route53"

  records = [
    {
      name = ""
      type    = "A"
      alias   = {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name = "terraform-test"
      type    = "CNAME"
      ttl = 300
      records = [
        "${var.domain_name}"
      ]
    }
  ]
}

# create inventory file for use by ansible inside the ansible directory, then deploy the ansible playbook
resource "local_file" "host_inventory" {
  content  = "${var.server_group}\n${module.ec2.*.webserver_public_ip[0]}\n${module.ec2.*.webserver_public_ip[1]}\n${module.ec2.*.webserver_public_ip[2]}\n${var.server_group_vars}\n${var.ansible_user}\n${var.ansible_ssh_private_key_file}"
  filename = var.inventory_path

  provisioner "local-exec" {
    command = "${var.ansible_cmd} ${var.ansible_switch} ${var.inventory_path} ${var.playbook_path} ${var.ssh_common_args} "
  }
}