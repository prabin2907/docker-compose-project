variable "secret_name" {
  description = "Name of the secret"
  type        = string
}

variable "private_key" {
  description = "Private key to store"
  type        = string
  sensitive   = true
}