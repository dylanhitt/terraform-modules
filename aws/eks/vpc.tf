data "aws_availability_zones" "available" {}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "3.14.2"
  name                 = var.name
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.private_subnet_cidrs
  public_subnets       = var.public_subnet_cidrs
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.name}" = "shared"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.name}" = "shared"
  }
}
