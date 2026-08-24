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

# -----------------------------------------------------
# Database01 Security group and rules
# -----------------------------------------------------
resource "aws_security_group" "database01_sg" {
  name        = var.database01_sg_name
  description = var.database01_sg_description
  vpc_id      = module.vpc.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "private_ssh" {
  security_group_id = aws_security_group.database01_sg.id
  cidr_ipv4         = var.vpc_cidr
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "database01_sql" {
  security_group_id = aws_security_group.database01_sg.id
  ip_protocol       = "tcp"
  from_port         = 3306
  to_port           = 3306
  referenced_security_group_id = aws_security_group.webserver01_sg.id
}

resource "aws_vpc_security_group_egress_rule" "database01_out" {
  security_group_id = aws_security_group.database01_sg.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}

# -------------------------------------------
# Webserver01 Security group
# -------------------------------------------
resource "aws_security_group" "webserver01_sg" {
  name        = var.webserver01_sg_name
  description = var.webserver01_sg_description
  vpc_id      = module.vpc.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "webserver01_ssh_from_my_ip" {
  security_group_id = aws_security_group.webserver01_sg.id
  cidr_ipv4         = "82.121.253.24/32"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "webserver01_http" {
  security_group_id = aws_security_group.webserver01_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "webserver01_https" {
  security_group_id = aws_security_group.webserver01_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "webserver01_out" {
  security_group_id = aws_security_group.webserver01_sg.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}

# -------------------------------------
# Instances
# --------------------------------------
#resource "aws_instance" "webserver01" {
  #ami = var.instance_webserver01_ami
  #instance_type = var.instance_webserver01_instance_type

  #subnet_id = module.vpc.public_subnets[0]
  #vpc_security_group_ids = [aws_security_group.webserver01_sg.id]

#}