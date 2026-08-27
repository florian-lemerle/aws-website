# -----------------------------------
# VPC
# -----------------------------------
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

# -----------------------------------
# Database01 security group and rules
# -----------------------------------
variable "aws_website_database01_sg_name" {
  type = string
}

variable "aws_website_database01_sg_description" {
  type = string
}

variable "aws_website_database01_sg_vpc_name" {
  type = string
}

variable "aws_website_database01_sg_tags" {
  type = map(any)
}

variable "aws_website_webserver01_sg_name" {
  type = string
}

variable "aws_website_webserver01_sg_description" {
  type = string
}

variable "aws_website_webserver01_sg_vpc_name" {
  type = string
}

variable "aws_website_webserver01_sg_tags" {
  type = map(any)
}

# -----------------------------------
# Instances
# -----------------------------------
variable "aws_website_key_name" {
  description = "Name of the key-pair"
  type = string
}

variable "aws_website_public_key_path" {
  description = "Path of the public key file"
  type = string
}

variable "aws_website_key_tags" {
  description = "Tags for the key-pair"
  type = map
}

variable "aws_website_webserver01_instance_type" {
  description = "Instance type of webserver01"
  type = string
}

variable "aws_website_webserver01_tags" {
  description = "Website01 tags"
  type = map
}

variable "aws_website_database01_instance_type" {
  description = "Instance type of database01"
  type = string
}

variable "aws_website_database01_tags" {
  description = "Website01 tags"
  type = map
}