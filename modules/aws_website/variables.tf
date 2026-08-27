# -----------------------------------
# VPC
# -----------------------------------
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block"
  type        = string
}

variable "vpc_azs" {
  description = "AZs to use for the VPC"
  type        = list(any)
}

variable "vpc_private_subnets" {
  description = "Private subnets to use for the VPC"
  type        = list(any)
}

variable "vpc_public_subnets" {
  description = "Public subnets to use for the VPC"
  type        = list(any)
}

variable "vpc_tags" {
  description = "Tags to apply to the resources"
  type        = map(any)
}

# -----------------------------------
# Database01 security group and rules
# -----------------------------------
variable "database01_sg_name" {
  description = "Security group settings"
  type        = string
}

variable "database01_sg_description" {
  description = "Description of security group."
  type        = string
}

variable "database01_sg_vpc_name" {
  description = "VPC name of this security group"
  type        = string
}

variable "database01_sg_tags" {
  description = "Tags"
  type        = map(any)
}

# -----------------------------------
# Webserver01 security group and rules
# -----------------------------------
variable "webserver01_sg_name" {
  description = "Security group settings"
  type        = string
}

variable "webserver01_sg_description" {
  description = "Description of security group."
  type        = string
}

variable "webserver01_sg_vpc_name" {
  description = "VPC name of this security group"
  type        = string
}

variable "webserver01_sg_tags" {
  description = "Tags"
  type        = map(any)
}

# -----------------------------------
# Instances
# -----------------------------------
variable "key_name" {
  description = "Name of the key-pair"
  type = string
}

variable "public_key_path" {
  description = "Path of the public key file"
  type = string
}

variable "key_tags" {
  description = "Tags for the key-pair"
  type = map
}

variable "webserver01_instance_type" {
description = "Instance type"
type = string
}

variable "webserver01_tags" {
description = "Tags to apply to the resource"
type = map
}

variable "database01_instance_type" {
description = "Instance type"
type = string
}

variable "database01_tags" {
description = "Tags to apply to the resource"
type = map
}