output "zone_id" {
    description = "ID of DNS zone"
    value = data.aws_route53_zone.zone.id
}