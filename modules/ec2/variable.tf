variable "environment" {
  type        = string
  description = "Environment list (qa,dev,prod)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID from vpc module"
}

variable "subnet_id" {
  type        = string
  description = "Public subnet ID for EC2"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 server"
}

variable "instance_type" {
  type        = string
  description = "Instance type for EC2 server"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "Allowed CIDR blocks for SG inbound rules"
}