terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" { region = var.aws_region }
resource "aws_security_group" "aurora" {
  name        = "${var.cluster_identifier}-sg"
  description = "Allow PostgreSQL traffic from the configured application network"
  vpc_id      = var.vpc_id
  ingress {
    description = "PostgreSQL from approved CIDR blocks"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_subnet_group" "aurora" {
  name       = "${var.cluster_identifier}-subnets"
  subnet_ids = var.subnet_ids
}
resource "aws_rds_cluster" "aurora" {
  cluster_identifier = var.cluster_identifier
  engine             = "aurora-postgresql"
  engine_mode        = "provisioned"
  database_name      = var.database_name
  master_username    = var.master_username
  master_password    = var.master_password
  db_subnet_group_name   = aws_db_subnet_group.aurora.name
  vpc_security_group_ids = [aws_security_group.aurora.id]
  storage_encrypted       = true
  backup_retention_period = 1
  deletion_protection     = true
  skip_final_snapshot     = false
  final_snapshot_identifier = "${var.cluster_identifier}-final"
  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 1
  }
  tags = { Name = var.cluster_identifier }
}
resource "aws_rds_cluster_instance" "aurora" {
  identifier         = "${var.cluster_identifier}-instance-1"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.aurora.engine
  engine_version     = aws_rds_cluster.aurora.engine_version
  publicly_accessible = false
}