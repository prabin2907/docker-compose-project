variable "name" {
  description = "Name of the security group"
  type        = string
  default     = "allow-web-traffic"
}

variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Allow web traffic (SSH, HTTP, HTTPS)"
}

variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed for inbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
