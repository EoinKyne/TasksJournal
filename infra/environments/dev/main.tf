module "secrets" {
  source = "../../modules/secrets"
  for_each = var.apps_secrets
    app_name = each.value.app_name
    namespace = each.value.namespace
    POSTGRES_DB = each.value.POSTGRES_DB
    POSTGRES_USER = each.value.POSTGRES_USER
    POSTGRES_PASSWORD = each.value.POSTGRES_PASSWORD
    SECRET_KEY = each.value.SECRET_KEY
}
module "config" {
  source = "../../modules/config"
  for_each = var.apps_config
    app_name = each.value.app_name
    ALLOWED_HOSTS = each.value.ALLOWED_HOSTS
    DEBUG = each.value.DEBUG
    DB_HOST = each.value.DB_HOST
    DB_PORT = each.value.DB_PORT
    namespace = "default"
}

module "journal_app_data" {
  source = "../../modules/journal_app_data"
  for_each = var.apps_database
    app_name = each.value.app_name
    namespace = each.value.namespace
    image = each.value.image
    image_pull_policy = each.value.image_pull_policy
    replicas = each.value.replicas
    container_name = each.value.container_name
    container_port = each.value.container_port
    service_name = each.value.service_name
    cluster_ip = each.value.cluster_ip
    secret_name = each.value.secret_name
    db_name_key = each.value.db_name_key
    db_user_key = each.value.db_user_key
    db_password_key = each.value.db_password_key
    storage_name = each.value.storage_name
    storage_access_mode = each.value.storage_access_mode
    storage_size = each.value.storage_size
    storage_path = each.value.storage_path
    storage_env_name = each.value.storage_env_name
    storage_env_value = each.value.storage_env_value
    storage_class_name = each.value.storage_class_name
    readiness_probe_initial_delay_seconds = each.value.readiness_probe_initial_delay_seconds
    readiness_probe_period_seconds = each.value.readiness_probe_period_seconds
}


module "journal_app" {
  source = "../../modules/journal_app"

  for_each = var.apps
    app_name = each.value.app_name
    namespace = each.value.namespace
    image = each.value.image
    image_pull_policy = each.value.image_pull_policy
    replicas = each.value.replicas
    container_port = each.value.container_port
    config_name = each.value.config_name
    secret_name = each.value.secret_name
    db_user_key = each.value.db_user_key
    resources_limits_cpu = each.value.resources_limits_cpu
    resources_limits_memory = each.value.resources_limits_memory
    resources_requests_cpu = each.value.resources_requests_cpu
    resources_requests_memory = each.value.resources_requests_memory
    files_directory_name = each.value.files_directory_name
    files_directory_mount_path = each.value.files_directory_mount_path
    init_container_name = each.value.init_container_name
    init_container_image = each.value.init_container_image
    init_container_image_pull_policy = each.value.init_container_image_pull_policy
    db_env_host_name = each.value.db_env_host_name
    db_host = each.value.db_host
    service_name = each.value.service_name
    target_ref_kind = each.value.target_ref_kind
    target_ref_api_version = each.value.target_ref_api_version
    min_replicas = each.value.min_replicas
    max_replicas = each.value.max_replicas
    metric_type = each.value.metric_type
    resource_target_name = each.value.resource_target_name
    resource_target_type = each.value.resource_target_type
    resource_target_cpu_utilization_percentage = each.value.resource_target_cpu_utilization_percentage
}

module "journal_app_web" {
  source = "../../modules/journal_app_web"
  for_each = var.apps_frontend
    app_name = each.value.app_name
    image = each.value.image
    image_pull_policy = each.value.image_pull_policy
    replicas = each.value.replicas
    port = each.value.port
    config_name = each.value.config_name
    secret_name = each.value.secret_name
    files_directory_name = each.value.files_directory_name
    files_directory_mount_path = each.value.files_directory_mount_path
    nginx_config_name = each.value.nginx_config_name
    nginx_config_mount_path = each.value.nginx_config_mount_path
    init_container_name = each.value.init_container_name
    init_container_image = each.value.init_container_image
    init_container_image_pull_policy = each.value.init_container_image_pull_policy
    service_type = each.value.service_type
}
module "ingress" {
  source = "../../modules/ingress"
  for_each = var.apps_ingress
    app_name = each.value.app_name
    namespace = each.value.namespace
    host = each.value.host
    path = each.value.path
    path_type = each.value.path_type
    service_name = each.value.service_name
    service_port = each.value.service_port
}
