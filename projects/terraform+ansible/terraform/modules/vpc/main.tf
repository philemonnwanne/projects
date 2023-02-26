/* 
this block configures a (VPC) module, which provisions networking resources such as a VPC, subnets, internet and NAT gateways
*/

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${var.vpc_name}"
  cidr = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  private_subnet_names = var.private_subnets_names
  public_subnets  = var.public_subnets
  public_subnet_names = var.public_subnets_names
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.tags
}