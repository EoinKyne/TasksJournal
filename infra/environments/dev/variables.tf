variable "apps_secrets" {
  description = "A map of application secrets to deploy as Secrets"
  type        = map(object({
    app_name = string
    namespace = string
    POSTGRES_DB = string
    POSTGRES_USER = string
    POSTGRES_PASSWORD = string
    SECRET_KEY = string
  }))
}

variable "apps_config" {
  description = "A map of application configurations to deploy as ConfigMaps"
  type        = map(object({
    app_name = string
    namespace = string
    DEBUG = string
    ALLOWED_HOSTS = string
    DB_HOST = string
    DB_PORT = string
  }))
}

variable "apps_database" {
  description = "A map of database applications to deploy"
  type        = map(object({
    app_name = string
    namespace = string
    image = string
    image_pull_policy = string
    replicas = number
    container_port = number
    container_name = string
    service_name = string
    cluster_ip = string
    secret_name = string
    db_name_key = string
    db_user_key = string
    db_password_key = string

    storage_name = string
    storage_access_mode = string
    storage_size = string
    storage_path = string
    storage_env_name = string
    storage_env_value = string
    storage_class_name = string
  }))
}

variable "apps" {
  description = "A map of applications to deploy"
  type        = map(object({
    app_name = string
    namespace = string
    image = string
    image_pull_policy = string
    replicas = number
    container_port = number
    config_name = string
    secret_name = string
    db_user_key = string
    resources_limits_cpu = string
    resources_limits_memory = string
    resources_requests_cpu = string
    resources_requests_memory = string
    files_directory_name = string
    files_directory_mount_path = string
    init_container_name = string
    init_container_image = string
    init_container_image_pull_policy = string
    db_env_host_name = string
    db_host = string
    service_name = string
    target_ref_kind = string
    target_ref_api_version = string
    min_replicas = number
    max_replicas = number
    metric_type = string
    resource_target_name = string
    resource_target_type = string
    resource_target_cpu_utilization_percentage = number
  }))
}

variable "apps_frontend" {
  description = "A map of frontend applications to deploy"
  type        = map(object({
    app_name = string
    image = string
    image_pull_policy = string
    replicas = number
    port = number
    config_name = string
    secret_name = string
    files_directory_name = string
    files_directory_mount_path = string
    nginx_config_name = string
    nginx_config_mount_path = string
    init_container_name = string
    init_container_image = string
    init_container_image_pull_policy = string
    service_type = string
  }))
}

variable "apps_ingress" {
  description = "A map of ingress configurations to deploy"
  type        = map(object({
    app_name = string
    namespace = string
    host = string
    path = string
    path_type = string
    service_name = string
    service_port = number
  }))
}

