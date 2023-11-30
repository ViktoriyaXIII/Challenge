# EC2 Security Group
resource "aws_security_group" "ec2_security_group" {
  name        = "weasel-crm-ec2-sg"
  description = "Security group for EC2 instances"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
  }
}

# RDS Security Group
resource "aws_security_group" "rds_security_group" {
  name        = "weasel-crm-rds-sg"
  description = "Security group for RDS instances"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # You may want to restrict this to a specific IP range
  }
}