output "webserver_public_ip" {
    description = "public IP addresses of EC2 webserver instances"
    value = module.ec2.public_ip
}

output "webserver_id" {
    description = "ID of EC2 webserver instances"
    value = module.ec2.id
}