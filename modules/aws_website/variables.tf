variable "vpc_name" {
  description = "VPC name"
  type        = string 
}

variable "cidr" {
  description = "CIDR block"
  type        = string 
}

variable "azs" {
  description = "AZs to use for the VPC"
  type        = list
}

variable "private_subnets" {
  description = "Private subnets to use for the VPC"
  type = list
}

variable "public_subnets" {
  description = "Public subnets to use for the VPC"
  type = list
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map
}