variable "aws_region" {
  description = "region to deploy all aws project resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "name prefix to assign to webserver instances"
  type        = string
  default     = "webserver-"
}

variable "domain_name" {
  description = "domain name to attach "
  type        = string
  default     = "philemonnwanne.me"
}

variable "ansible_user" {
  description = "the user ansbile will log in as"
  type        = string
  default     = "ansible_user=ec2-user"
}

variable "ansible_ssh_private_key_file" {
  description = "private key file to access the webserver instances"
  type        = string
  default     = "ansible_ssh_private_key_file=../ansible/webserver-key.pem"
}

variable "server_group" {
  description = "group all web instances belong to"
  type        = string
  default     = "[webservers]"
}

variable "server_group_vars" {
  description = "webservers group variable declarations"
  type        = string
  default     = "[webservers:vars]"
}

variable "playbook_path" {
  description = "path where the playbook resides"
  type        = string
  default     = "../ansible/playbook.yml"
}

variable "inventory_path" {
  description = "path to the host inventory file"
  type        = string
  default     = "../ansible/host-inventory"
}

variable "ansible_switch" {
   description = "valid options you can pass to the ansible playbook command"
  type        = string
  default     = "-i"
}

variable "ansible_cmd" {
   description = "valid options you can pass to the ansible playbook command"
  type        = string
  default     = "ansible-playbook"
}

variable "ssh_common_args" {
  description = "extra arguments passed to the SSH command"
  type        = string
  default     = "--ssh-common-args='-o StrictHostKeyChecking=no'"
}