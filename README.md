# Multi-Environment AWS Terraform Infrastructure

A modular Terraform project to provision core AWS infrastructure—including networking, compute, and database resources—across multiple environments (`dev`, `qa`, and `prod`) with remote state stored in Amazon S3.

---

## Architecture Overview

- **Remote State Backend (`backend-setup/` & `backend.tf`):** Provisions an S3 bucket for remote Terraform state storage and enables native S3 state locking (`use_lockfile = true`).
- **Networking (`modules/vpc/`):** Creates a custom VPC, public and private subnets, an Internet Gateway, and route tables.
- **Compute (`modules/ec2/`):** Provisions an EC2 web server instance along with its security group.
- **Database (`modules/rds/`):** Provisions an RDS MySQL database instance, DB subnet group, and security group.
- **Environment Isolation (`environments/`):** Keeps environment-specific values separated in `dev`, `qa`, and `prod` variable files.

---

## Project Structure

```text
terraform-multi-env-infrastructure/
├── backend-setup/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── .terraform.lock.hcl
├── environments/
│   ├── dev/
│   │   └── dev.tfvars
│   ├── qa/
│   │   └── qa.tfvars
│   └── prod/
│       └── prod.tfvars
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── rds/
├── .gitignore
├── .terraform.lock.hcl
├── backend.tf
├── main.tf
├── variables.tf
└── outputs.tf

## Prerequisites
Before running this project, make sure you have:
1.Terraform installed on your machine.
2.AWS CLI installed and configured (aws configure) with credentials for your target region (e.g., ap-south-1).
3.An AWS account with permissions to manage S3, VPC, EC2, and RDS resources.
