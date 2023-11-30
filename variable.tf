variable "aws_region" {
  default = "us-east-1"
}


variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Replace with your desired CIDR block
}



variable "private_subnet1" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.0.1.0/24"  # Replace with your desired CIDR block for private subnet 1
}

variable "private_subnet2" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.0.2.0/24"  # Replace with your desired CIDR block for private subnet 2
}

variable "private_subnet3" {
  description = "CIDR block for private subnet 3"
  type        = string
  default     = "10.0.3.0/24"  # Replace with your desired CIDR block for private subnet 3
}



variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "Dev",
    Project     = "Weasel-CRM"
  }
}


# variable "rds_username_secret_arn" {
#   description = "ARN of the secret in AWS Secrets Manager containing RDS username"
#   default = ""
# }

# variable "rds_password_secret_arn" {
#   description = "ARN of the secret in AWS Secrets Manager containing RDS password"
#   default = ""
# }