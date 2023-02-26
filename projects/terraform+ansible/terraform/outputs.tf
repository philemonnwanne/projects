output "final_vpc_id" {
    description = "id of project VPC"
    value = module.vpc.mini_vpc_id
}

output "final_vpc_name" {
    description = "project VPC name"
    value = module.vpc.mini_vpc_name
}

output "final_vpc_subnet_id" {
    description = "project VPC subnet ID"
    value = module.vpc.mini_vpc_subnet_id
}

output "final_vpc_security_group_id" {
     description = "project VPC default security group ID"
    value = module.vpc.mini_vpc_security_group_id
}

output "final_webserver_security_group_id" {
    description = "security group controlling traffic access to the webserver instances"
    value = module.security.webserver_security_group_id
}

output "final_instance_public_ip" {
    description = "public IP addresses of EC2 webserver instances"
    value = module.ec2.*.webserver_public_ip
}

output "number-of-instances-created" {
    value = length(module.ec2.*.webserver_id)
}