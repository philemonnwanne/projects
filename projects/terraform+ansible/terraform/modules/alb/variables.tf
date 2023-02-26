variable "alb_name" {
  description = "application load balancer name"
  type        = string
  default     = "webserver-alb"
}

variable "vpc_id" {
  description = "VPC default id"
  type        = string
}

variable "subnets" {
  description = "a list of subnets to associate with the load balancer"
  type        = list(string)
}

variable "security_groups" {
  description = "the security groups to attach to the load balancer"
  type        = list(string)
}

variable "target_groups_name" {
  description = "name prefix to assign to webserver instances"
  type        = string
  default     = "web-tg"
}

variable "target_type" {
  description = "load balancer target type e.g (instance)(ip-address)(lambda)"
  type        = string
  default     = "instance"
}

variable "target_01" {
  description = "a map containing a key/value pair that define the first target"
  type        = string
}

variable "target_02" {
  description = "a map containing a key/value pair that define the second target"
  type        = string
}

variable "target_03" {
  description = "a map containing a key/value pair that define the third target"
  type        = string
}

variable "ssl_cert" {
  description = "SSL certificate to apply to the HTTPS listener"
  type        = string
  default     = "arn:aws:acm:us-east-1:183066416469:certificate/cdc302d8-b3b0-46de-8ded-2f2e86fcae7c"
}