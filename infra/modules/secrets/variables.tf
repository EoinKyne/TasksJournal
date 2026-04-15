variable "app_name" {
  description = "The name of the application"
  type        = string
}
variable "namespace" {
  description = "The Kubernetes namespace for the secrets"
  type        = string
  default     = "default"
}
variable "POSTGRES_DB" {
  description = "The name of the PostgreSQL database"
  type        = string
  default     = "journal_db"
}
variable "POSTGRES_USER" {
  description = "The username for the PostgreSQL database"
  type        = string
  default     = "postgres"
}
variable "POSTGRES_PASSWORD" {
  description = "The password for the PostgreSQL database"
  type        = string
  default     = "postgres"
}
variable "SECRET_KEY" {
  description = "A secret key for the application"
  type        = string
}