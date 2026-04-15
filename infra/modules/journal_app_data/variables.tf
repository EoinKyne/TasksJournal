variable "app_name" {
  description = "The name of the application"
  type        = string
}
variable "namespace" {
  description = "The Kubernetes namespace for the application"
  type        = string
  default = "default"
}
variable "image" {
  description = "The container image for the application"
  type        = string
}
variable "image_pull_policy" {
  description = "The image pull policy for the container (e.g., Always, IfNotPresent)"
  type        = string
  default     = "IfNotPresent"
}
variable "replicas" {
  description = "The number of replicas for the application"
  type        = number
}
variable "container_name" {
  description = "The name of the container"
  type        = string
}
variable "container_port" {
  description = "The port the container listens on"
  type        = number
}
variable "service_name" {
  description = "The name of the Kubernetes service"
  type        = string
}
variable "cluster_ip" {
  description = "The cluster IP for the Kubernetes service (use 'None' for headless)"
  type        = string
}
variable "secret_name" {
  description = "The name of the Kubernetes secret containing database credentials"
  type        = string
}
variable "db_name_key" {
  description = "The key in the secret for the database name"
  type        = string
}
variable "db_user_key" {
  description = "The key in the secret for the database user"
  type        = string
}
variable "db_password_key" {
  description = "The key in the secret for the database password"
  type        = string
}
variable "storage_name" {
  description = "The name of the PersistentVolumeClaim for storage"
  type        = string
}
variable "storage_access_mode" {
  description = "The access mode for the PersistentVolumeClaim (e.g., ReadWriteOnce)"
  type        = string
}
variable "storage_size" {
  description = "The size of the PersistentVolumeClaim (e.g., 1Gi)"
  type        = string
}
variable "storage_path" {
  description = "The path where the storage will be mounted in the container"
  type        = string
}
variable "storage_env_name" {
  description = "The name of the environment variable for the storage path"
  type        = string
}
variable "storage_env_value" {
  description = "The value of the environment variable for the storage path"
  type        = string
}
variable "storage_class_name" {
  description = "The name of the StorageClass for the PersistentVolumeClaim"
  type        = string
}
