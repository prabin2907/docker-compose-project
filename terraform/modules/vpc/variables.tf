variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "vpc-p"
}

variable "igw_name" {
  default = "igw-p"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "availability_zone_a" {
  default = "ap-south-1a"
}

variable "availability_zone_b" {
  default = "ap-south-1b"
}

variable "public_subnet_name" {
  default = "public-subnet-p"
}

variable "private_subnet_name" {
  default = "private-subnet-p"
}

variable "public_route_table_name" {
  default = "public-route-table-p"
}

variable "private_route_table_name" {
  default = "private-route-table-p"
}

variable "nat_eip_name" {
  default = "nat-eip-p"
}

variable "nat_gateway_name" {
  default = "nat-gateway-p"
}