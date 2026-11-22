variable "environment" {
  type        = string
  description = "Environment name (dev, qa, prod)"
  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "Invalid environment! Choose only dev, qa, or prod."
  }
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDR blocks"
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  description = "AWS Availability Zones"
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
  // default = "01d03173bef0a0a89"
}

variable "instance_type" {
  type        = string
  description = "Instance type for EC2 instance"
  default     = "t3.micro"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "Allowed CIDR blocks for Security Group"
  default     = ["0.0.0.0/0"]
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
}

variable "db_name" {
  type        = string
  description = "Database name"
}
variable "db_username" {
  type        = string
  description = "Database username"
}

variable "db_password" {
  type        = string
  description = "Database master password"
  sensitive   = true

}
