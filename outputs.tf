output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "Created VPC ID"
}

output "web_server_public_ip" {
  value       = module.ec2.web_server_public_ip
  description = "Public IP of EC2 instance"
}

output "rds_endpoint" {
  value       = module.rds.rds_endpoint
  description = "RDS Mysql endpoint"

}
