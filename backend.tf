terraform {
  backend "s3" {
    bucket         = "jay-tfstate-multi-env-2026"
    key            = "multi-env/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true

  }
}
