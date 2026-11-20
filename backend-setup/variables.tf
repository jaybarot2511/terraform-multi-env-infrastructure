variable "environment" {
  type        = string
  description = "Environment list (qa,dev,prod)"
  validation {
    condition     = contains(["qa", "dev", "prod"], var.environment)
    error_message = "invalid enviroment ! choose only qa , dev , prod."
  }
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "public subnet cidr block"
  default     = ["10.0.0.0/16", "10.0.0.0/16"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "private subnet cidrs blocks"
  default     = ["10.0.0.0/16", "10.0.0.0/16"]
}

variable "availability_zones" {
  type        = list(string)
  description = "aws availability zones"
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "instance_type" {
  type        = string
  description = "instance type of ec2 server"
  default     = "t3.micro"
}

variable "allow_cidr_blocks" {
  type        = list(string)
  description = "Allow CIDR blocks SG inbound rules"
  default     = ["0.0.0.0/0"]
}


