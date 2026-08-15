data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

module "aws_website" {
  source = "../../modules/aws_website"

  vpc_name = var.aws_website_vpc_name
  vpc_cidr = var.aws_website_cidr

  vpc_azs             = var.aws_website_azs
  vpc_private_subnets = var.aws_website_private_subnets
  vpc_public_subnets  = var.aws_website_public_subnets
  vpc_tags            = var.aws_website_tags

  sg_private_name        = var.aws_website_sg_private_name
  sg_private_description = var.aws_website_sg_private_description
  sg_private_vpc_name    = var.aws_website_vpc_name
  sg_private_tags        = var.aws_website_sg_private_tags

  sg_public_name        = var.aws_website_sg_public_name
  sg_public_description = var.aws_website_sg_public_description
  sg_public_vpc_name    = var.aws_website_vpc_name
  sg_public_tags        = var.aws_website_sg_public_tags
}