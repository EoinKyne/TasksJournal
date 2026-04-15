variable "app_name" {
  description = "The name of the application"
  type        = string
}
variable "namespace" {
  description = "The Kubernetes namespace for the ingress"
  type        = string
  default     = "default"
}
variable "host" {
  description = "The host for the ingress rule"
  type        = string
  default     = "app.local"
}
variable "path" {
  description = "The path for the ingress rule"
  type        = string
  default     = "/"
}
variable "path_type" {
  description = "The type of the path (e.g., Prefix, Exact)"
  type        = string
  default     = "Prefix"
}
variable "service_name" {
  description = "The name of the service to route to"
  type        = string
}
variable "service_port" {
  description = "The port of the service to route to"
  type        = number
}

