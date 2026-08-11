variable "aws_website_vpc_name" {
  description = "Name of the VPC"
  type = string
}

variable "aws_website_azs" {
  description = "Availability Zones"
  type = list
}

variable "aws_website_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "aws_website_private_subnets" {
  description = "Private Subnets"
  type = list
}

variable "aws_website_public_subnets" {
  description = "Public Subnets"
  type = list
}

variable "aws_website_tags" {
  description = "Tags for the resources"
  type = map
}
