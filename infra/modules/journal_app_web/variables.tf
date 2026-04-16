variable "app_name" {
  description = "The name of the application."
  type        = string
}
variable "image" {
  description = "The Docker image for the application."
  type        = string
}
variable "image_pull_policy" {
  description = "The image pull policy for the application container."
  type        = string
}
variable "replicas" {
  description = "The number of replicas for the application."
  type        = number
}
variable "port" {
  description = "The port on which the application will listen."
  type        = number
}
variable "config_name" {
  description = "The name of the ConfigMap for application configuration"
  type        = string
}
variable "secret_name" {
  description = "The name of the Secret for application secrets"
  type        = string
}
variable "files_directory_name" {
  description = "The name of the volume for static files."
  type        = string
}
variable "files_directory_mount_path" {
  description = "The mount path for the static files volume."
  type        = string
}
variable "nginx_config_name" {
  description = "The name of the ConfigMap for Nginx configuration."
  type        = string
}
variable "nginx_config_mount_path" {
  description = "The mount path for the Nginx configuration volume."
  type        = string
}
variable "init_container_name" {
  description = "The name of the init container for copying static files."
  type        = string
}
variable "init_container_image" {
  description = "The Docker image for the init container."
  type        = string
}
variable "init_container_image_pull_policy" {
  description = "The image pull policy for the init container."
  type        = string
}
variable "service_type" {
  description = "The type of Kubernetes Service to create (e.g., ClusterIP, NodePort, LoadBalancer)."
  type        = string
}
variable "readiness_probe_path" {
  description = "The HTTP path for the readiness probe."
  type        = string
}
variable "readiness_probe_period_seconds" {
  description = "The period in seconds for the readiness probe."
  type        = number
}
variable "readiness_probe_initial_delay_seconds" {
  description = "The initial delay in seconds for the readiness probe."
  type        = number
}
variable "liveness_probe_path" {
  description = "The HTTP path for the liveness probe."
  type        = string
}
variable "liveness_probe_period_seconds" {
  description = "The period in seconds for the liveness probe."
  type        = number
}
variable "liveness_probe_initial_delay_seconds" {
  description = "The initial delay in seconds for the liveness probe."
  type        = number
}