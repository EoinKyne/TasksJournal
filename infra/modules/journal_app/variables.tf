variable "db_host" {
  description = "The hostname of the database service"
  type        = string
}
variable "app_name" {
  description = "The name of the application"
  type        = string
}
variable "image" {
  description = "The container image to use for the application"
  type        = string
}
variable "replicas" {
  description = "The number of replicas for the application"
  type        = number
}
variable "container_port" {
  description = "The port that the application container listens on"
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
variable "resources_limits_cpu" {
  description = "The CPU limit for the application container"
  type        = string
}
variable "resources_limits_memory" {
  description = "The memory limit for the application container"
  type        = string
}
variable "resources_requests_cpu" {
  description = "The CPU request for the application container"
  type        = string
}
variable "resources_requests_memory" {
  description = "The memory request for the application container"
  type        = string
}
variable "files_directory_name" {
  description = "The name of the volume for static files"
  type        = string
}
variable "files_directory_mount_path" {
  description = "The mount path for the static files volume"
  type        = string
}
variable "init_container_name" {
  description = "The name of the init container for database migrations"
  type        = string
}
variable "init_container_image" {
  description = "The container image to use for the init container"
  type        = string
}
variable "init_container_image_pull_policy" {
  description = "The image pull policy for the init container"
  type        = string
}
variable "image_pull_policy" {
  description = "The image pull policy for the application container"
  type        = string
}
variable "db_env_host_name" {
  description = "The name of the environment variable for the database host"
  type        = string
}
variable "db_user_key" {
  description = "The key in the secret for the database user"
  type        = string
}