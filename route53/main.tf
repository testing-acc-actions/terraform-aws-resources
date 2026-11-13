terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}
resource "aws_route53_record" "demo" {
  zone_id = var.hosted_zone_id
  name    = var.record_name
  type    = "CNAME"
  ttl     = 300
  records = [var.record_target]
}
