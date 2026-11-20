output "vpc_id" {
  value = module.vpc.vpc_id
}

output "web_server_public_ip" {
  value = module.ec2.web_server_public_ip
}
