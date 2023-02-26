output "mini_vpc_id" {
    description = "project VPC ID"
    value = module.vpc.vpc_id
}

output "mini_vpc_name" {
    description = "project VPC name"
    value = module.vpc.name
}

output "mini_vpc_subnet_id" {
    description = "project VPC subnet ID"
    value = module.vpc.public_subnets
}

output "mini_vpc_security_group_id" {
    description = "project VPC default security group ID"
    value = module.vpc.default_security_group_id
}

output "azs" {
    description = "AZ to start the instance in"
    value = module.vpc.azs
}