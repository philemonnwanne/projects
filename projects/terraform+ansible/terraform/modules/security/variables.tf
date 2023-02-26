variable "webserver_security_group_name" {
  description = "webserver security group name"
  type        = string
  default     = "webserver-security-group"
}

variable "webserver_security_group_ingress_cidr" {
  description = "security group inbound CIDR block"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "webserver_security_group_ingress_rules" {
  description = "security group inbound rules"
  type        = list(string)
  default     = [
    "http-80-tcp",
    "https-443-tcp",
    "ssh-tcp"
    ]
}

variable "vpc_id" {
  description = "VPC default id"
  type        = string
}

variable "security_group_egress_cidr" {
  description = "security group outbound CIDR block"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "security_group_egress_rules" {
  description = "security group outbound rules"
  type        = list(string)
  default     = ["all-all"]
}

variable "alb_security_group_name" {
  description = "application load balancer security group name"
  type        = string
  default     = "alb-security-group"
}

variable "alb_security_group_ingress_cidr" {
  description = "security group inbound CIDR block"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_security_group_ingress_rules" {
  description = "security group inbound rules"
  type        = list(any)
  default     = [
    "http-80-tcp",
    "https-443-tcp"
    ]
}