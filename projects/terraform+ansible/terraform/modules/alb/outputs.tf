output "lb_dns_name" {
    description = "the DNS name of the load balancer"
    value = module.alb.lb_dns_name
}

output "lb_zone_id" {
  description = "the zone_id of the load balancer to assist with creating DNS records"
  value = module.alb.lb_zone_id
}