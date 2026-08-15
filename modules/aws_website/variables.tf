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

variable "sg_private_name" {
  description = "Security group settings"
  type        = string
}

variable "sg_private_description" {
  description = "Description of security group."
  type        = string
}

variable "sg_private_vpc_name" {
  description = "VPC name of this security group"
  type        = string
}

variable "sg_private_tags" {
  description = "Tags"
  type        = map(any)
}

variable "sg_public_name" {
  description = "Security group settings"
  type        = string
}

variable "sg_public_description" {
  description = "Description of security group."
  type        = string
}

variable "sg_public_vpc_name" {
  description = "VPC name of this security group"
  type        = string
}

variable "sg_public_tags" {
  description = "Tags"
  type        = map(any)
}

#variable "webserver01_ami" {
#description = "AMI of instance"
#type = string
#}

#variable "webserver01_instance_type" {
#description = "Instance type"
#type = string
#}

#variable "webserver01_tags" {
#description = "Tags to apply to the resource"
#type = map
#}
