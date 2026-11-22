output "rds_endpoint" {
  value       = aws_db_instance.mysql_db.endpoint
  description = "Connection endpoint for the RDS instance"
}

output "rds_db_name" {
  value       = aws_db_instance.mysql_db.db_name
  description = "Database name"
}
