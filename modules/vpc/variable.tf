variable "vpc_cidr" {
  type        = string
  description = "vpc cidr block"
}

variable "environment" {
  type        = string
  description = "Environment list (qa,dev,prod)"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "public cidr blocks"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "private subnet cidr blocks"
}

variable "availability_zones" {
  type        = list(string)
  description = "aws availability zones"
}