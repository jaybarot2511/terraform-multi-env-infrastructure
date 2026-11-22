terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source               = "./modules/vpc"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "ec2" {
  source              = "./modules/ec2"
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  subnet_id           = module.vpc.public_subnet_ids[0]
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  allowed_cidr_blocks = var.allowed_cidr_blocks
}

module "rds" {
  source                = "./modules/rds"
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  ec2_security_group_id = module.ec2.ec2_security_group_id
  db_instance_class     = var.db_instance_class
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password

}
