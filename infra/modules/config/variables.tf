variable "app_name" {
  description = "The name of the application."
  type        = string
}
variable "namespace" {
  description = "The Kubernetes namespace for the application."
  type        = string
  default     = "default"
}
variable "DEBUG" {
  description = "Django debug mode."
  type        = string
  default     = "False"
}
variable "ALLOWED_HOSTS" {
  description = "Django allowed hosts."
  type        = string
  default     = "simplememo.org"
}
variable "DB_HOST" {
  description = "Database host for the application."
  type        = string
  default     = "journal-app-data-headless"
}
variable "DB_PORT" {
  description = "Database port for the application."
  type        = string
  default     = "5432"
}