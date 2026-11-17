variable "vpc_cidr" {
  type        = string
  description = "vpc cidr block"
  default     = "10.0.0.0/16"
}

variable "environment" {
  type        = string
  description = "Evivrment list (qa,dev,prod)"

}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "public cidr blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"] // દરેક માટે અલગ IP range
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "private subnet cidr blocks"
  default     = ["10.0.10.0/24", "10.0.20.0/24"] // દરેક માટે અલગ IP range
}

variable "availability_zones" {
  type        = list(string)
  description = "aws availability zones"
  default     = ["ap-south-1a", "ap-south-1b"]
}


variable "ami_id" {
  type        = string
  description = "AMI ID for Ec2 server "
  default     = "ami-04b0b8ee9ce90920a"

}
variable "instance_type" {
  type        = string
  description = "instance type for ec2 server"
  default     = "t3.micro"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "Allwed CIDR blocks SQ inbound rules"
  default     = ["0.0.0.0/0"]
}



