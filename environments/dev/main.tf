
module "aws_website" {
  source = "../../modules/aws_website"

  vpc_name = var.aws_website_vpc_name
  vpc_cidr = var.aws_website_cidr

  vpc_azs             = var.aws_website_azs
  vpc_private_subnets = var.aws_website_private_subnets
  vpc_public_subnets  = var.aws_website_public_subnets
  vpc_tags            = var.aws_website_tags

  database01_sg_name        = var.aws_website_database01_sg_name
  database01_sg_description = var.aws_website_database01_sg_description
  database01_sg_vpc_name    = var.aws_website_vpc_name
  database01_sg_tags        = var.aws_website_database01_sg_tags

  webserver01_sg_name        = var.aws_website_webserver01_sg_name
  webserver01_sg_description = var.aws_website_webserver01_sg_description
  webserver01_sg_vpc_name    = var.aws_website_vpc_name
  webserver01_sg_tags        = var.aws_website_webserver01_sg_tags

  key_name = var.aws_website_key_name
  public_key_path = var.aws_website_public_key_path
  key_tags = var.aws_website_key_tags

  webserver01_instance_type = var.aws_website_webserver01_instance_type
  webserver01_tags = var.aws_website_webserver01_tags

  database01_instance_type = var.aws_website_database01_instance_type
  database01_tags = var.aws_website_database01_tags
}