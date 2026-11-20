output "ec2_instance_id" {
  value       = aws_instance.web_server.id
  description = "ID of EC2 instance"
}

output "web_server_public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "The public IP address of the web server"
}