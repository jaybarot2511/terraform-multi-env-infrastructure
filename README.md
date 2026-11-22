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
```

## Getting Started

### Step 1: Provision the S3 State Backend

Create the S3 bucket that holds the Terraform state file:

```bash
cd backend-setup
terraform init
terraform plan
terraform apply
## Getting Started

- **Step 1: Provision the S3 State Backend:** Create the S3 bucket for remote state storage (`cd backend-setup` -> `terraform init` -> `terraform plan` -> `terraform apply`).
- **Step 2: Initialize Root Project & Migrate State:** Return to the root directory and migrate state (`cd ..` -> `terraform init -migrate-state`).
- **Step 3: Validate, Plan & Apply Infrastructure:** Format, validate, and deploy your target environment (`terraform fmt -recursive` -> `terraform validate` -> `terraform plan -var-file="environments/dev/dev.tfvars"` -> `terraform apply -var-file="environments/dev/dev.tfvars"`).
- **Step 4: Verify Outputs & State:** Check provisioned resource details and tracked state (`terraform output` -> `terraform state list`).
- **Step 5: Destroy Resources After Testing:** Clean up all AWS resources after testing to avoid charges (`terraform destroy -var-file="environments/dev/dev.tfvars"`).
