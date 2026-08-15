module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = var.vpc_name
  cidr   = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = var.vpc_tags
}

resource "aws_security_group" "private_default" {
  name        = var.sg_private_name
  description = var.sg_private_description
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group" "public_default" {
  name        = var.sg_public_name
  description = var.sg_public_description
  vpc_id      = module.vpc.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "private_ssh" {
  security_group_id = aws_security_group.private_default.id
  cidr_ipv4         = var.vpc_cidr
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "private_sql" {
  security_group_id = aws_security_group.private_default.id
  cidr_ipv4         = var.vpc_cidr
  ip_protocol       = "tcp"
  from_port         = 3306
  to_port           = 3306
}

resource "aws_vpc_security_group_ingress_rule" "public_ssh" {
  security_group_id = aws_security_group.public_default.id
  cidr_ipv4         = "82.121.253.24/32"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

#resource "aws_instance" "webserver01" {
#  ami = var.webserver01_ami
#  instance_type = var.webserver01_instance_type
#
#  subnet_id = module.vpc.private_subnets[0]

#}