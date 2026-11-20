# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }
# provider "aws" {
#   region = "ap-south-1"  
# }

# module "vpc" {
#   source = "./modules/vpc"
#   environment = var.enviroment
#   vpc_cidr = var.vpc_cidr
#   public_subnet_id = var.public_subnet_cidrs
#   private_subnet_id = var.private_subnet_cidrs
#   availability_zones = var.availability_zones
# }


# module "ec2" {
#   source = "./modules/ec2"
#   instance_type = var.instance_type
#   environment = var.enviroment
#   vpc_id = mosules.vpc.vpc_cidr
#   subnet_id = module.vpc.public_subnet_id[0]
#   ami_id = var.ami_id
#   allowed_cidr_blocks = var.allowed_cidr_blocks
# }


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