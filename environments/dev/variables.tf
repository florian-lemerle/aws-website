variable "aws_website_vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "aws_website_azs" {
  description = "Availability Zones"
  type        = list(any)
}

variable "aws_website_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "aws_website_private_subnets" {
  description = "Private Subnets"
  type        = list(any)
}

variable "aws_website_public_subnets" {
  description = "Public Subnets"
  type        = list(any)
}

variable "aws_website_tags" {
  description = "Tags for the resources"
  type        = map(any)
}

variable "aws_website_sg_private_name" {
  type = string
}

variable "aws_website_sg_private_description" {
  type = string
}

variable "aws_website_sg_private_vpc_name" {
  type = string
}

variable "aws_website_sg_private_tags" {
  type = map(any)
}

variable "aws_website_sg_public_name" {
  type = string
}

variable "aws_website_sg_public_description" {
  type = string
}

variable "aws_website_sg_public_vpc_name" {
  type = string
}

variable "aws_website_sg_public_tags" {
  type = map(any)
}