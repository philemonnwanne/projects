# this block retrieves info about an existing hosted zone, which is in turn used to poupulate the records module
data "aws_route53_zone" "zone" {
  zone_id      = var.zone_id
  private_zone = false
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_id = data.aws_route53_zone.zone.zone_id
  records = var.records
}