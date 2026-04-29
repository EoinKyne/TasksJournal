variable "app_name" {
  description = "The name of the application"
  type        = string
}
variable "namespace" {
  description = "The Kubernetes namespace for the secrets"
  type        = string
  default     = "default"
}
variable "postgres_db" {
  description = "The name of the PostgreSQL database"
  type        = string
  sensitive   = true
}
variable "postgres_user" {
  description = "The username for the PostgreSQL database"
  type        = string
  sensitive   = true
}
variable "postgres_password" {
  description = "The password for the PostgreSQL database"
  type        = string
  sensitive   = true
}
variable "secret_key" {
  description = "A secret key for the application"
  type        = string
  sensitive   = true
}