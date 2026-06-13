variable "ami_id" {
  description = "AMI ID for EC2 instance (leave empty to auto-find Ubuntu 22.04)"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach to EC2"
  type        = string
}

variable "associate_public_ip" {
  description = "Associate public IP to EC2"
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
  default     = "terraform-ec2-p"
}

variable "user_data" {
  description = "Path to user_data script file"
  type        = string
  default     = ""
}
