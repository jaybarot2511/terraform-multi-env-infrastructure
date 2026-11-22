resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.environment}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.environment}-rds-subnet-group"
    Environment = var.environment
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.environment}-rds-sg"
  description = "allow Mysql inbound traffic from ec2 instance"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySql from ec2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.environment}-rds-sg"
    Environment = var.environment
  }
}

resource "aws_db_instance" "mysql_db" {
  identifier             = "${var.environment}-mysql-db"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  db_name                = var.db_name
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true


  tags = {
    Name        = "${var.environment}-mysql-db"
    Environment = var.environment
  }

}
