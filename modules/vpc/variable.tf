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
  description = "public cidr block"
  default     = ["10.0.0.0/24", "10.0.0.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "private subnet cidr blocks"
  default     = ["10.0.0.0/24", "10.0.0.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  description = "aws availability zones"
  default     = ["ap-southeast-2","ap-southeast-1"]
}
