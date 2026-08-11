module "aws_website" {
  source = "../../modules/aws_website"

  vpc_name = var.aws_website_vpc_name
  cidr = var.aws_website_cidr

  azs = var.aws_website_azs
  private_subnets = var.aws_website_private_subnets
  public_subnets  = var.aws_website_public_subnets

  enable_nat_gateway = true

  tags = var.aws_website_tags

}