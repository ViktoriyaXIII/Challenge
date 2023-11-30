# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = var.tags
}

# Subnets
resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet1
  tags                    = var.tags
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet2
  tags                    = var.tags
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet3
  tags                    = var.tags
  map_public_ip_on_launch = false
}

# EC2 Instances
resource "aws_instance" "ec2_instances" {
  count         = 2
  ami           = "ami-0410c4cfab17013ee"  
  instance_type = "t2.micro"

  tags = {
    Name = "weasel-crm-instance-rodent${count.index + 1}"
  }
}

resource "aws_db_instance" "rodent" {
  identifier        = "weasel-crm-mydbinstance"
  allocated_storage = 10
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  db_name =

  tags = {
    Name = "weasel-crm-mydbinstance"
  }

  # Retrieve RDS username from Secrets Manager
  username              = aws_secretsmanager_secret_version.rds_username.version_stages[0].secret_string

  # Retrieve RDS password from Secrets Manager
  password              = aws_secretsmanager_secret_version.rds_password.version_stages[0].secret_string
}

# RDS Database
resource "aws_db_instance" "rds_database" {
  engine           = "mysql"
  engine_version   = "8.0.34"
  instance_class   = "db.t2.micro"
  allocated_storage = 10
  storage_type      = "gp2"

  tags = {
    Name = "weasel-crm-rds-rodent"
  }
}



# S3 Bucket
resource "aws_s3_bucket" "private_bucket" {
  bucket = "weasel-crm-bucket-rodent"  # Replace with a creative name

  acl    = "private"
  force_destroy = true
}