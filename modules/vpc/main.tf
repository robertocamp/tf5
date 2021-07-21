data "aws_availability_zones" "available" {}


resource "aws_eip" "nat" {
  count = 3
  vpc = true 
}



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>2.0"

  name = var.vpc_name

  cidr            = var.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = true
  external_nat_ip_ids = "${aws_eip.nat.*.id}"

  tags = {
    Environment = "DEV"
    Team        = "Network"
  }
}