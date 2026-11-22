variable "environment" {
  type        = string
  description = "Environment name (dev, qa, prod)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where RDS will be deployed"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for DB subnet group"
}

variable "ec2_security_group_id" {
  type        = string
  description = "Security group ID of EC2 instance to allow DB access"
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
}

variable "db_name" {
  type        = string
  description = "Initial database name"
}

variable "db_username" {
  type        = string
  description = "Master username for RDS"
}

variable "db_password" {
  type        = string
  description = "Master password for RDS"
  sensitive   = true
}