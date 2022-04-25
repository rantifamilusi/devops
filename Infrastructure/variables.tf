/*
This file contains all the variables defined for the terraform code
Refer to terraform-{env}.tfvars for the actual value for these variables
*/

# Variables for Azure resource group
variable "resource_group_name" {}
variable "resource_group_location" {}
variable "environment" {}

# Variables for Kubernetes Cluster
variable "cluster_name" {}
variable "dns_prefix" {}

variable "k8s_version" {}

# Variables for Node pool
variable "node_pool_name" {}
variable "node_pool_count" {}
variable "node_pool_vm_size" {}
variable "node_pool_max_count" {}
variable "node_pool_min_count" {}

variable "k8s_type" {}
variable "node_pool_osdisk_size" {}
variable "enable_auto_scaling" {}

# Variables for Service Principal and Tenant
variable "client_id" {}
variable "subscription_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# Variables for Network Profile
variable "network_plugin" {}
variable "load_balancer_sku" {}

variable "acr_name" {}

# Variables for Azure Database for PostgreSQL servers
variable "sql_name" {}
variable "sku_name" {}
variable "storage_mb" {}
variable "geo_redundant_backup_enabled" {}
variable "auto_grow_enabled" {}
variable "backup_retention_days" {}

variable "admin_login" {}
variable "administrator_login_password" {}
variable "server_version" {}
variable "ssl_enforcement_enabled" {}
variable "ssl_minimal_tls_version_enforced" {}
variable "public_network_access_enabled" {}

variable "sql_db_name" {}
variable "db_charset" {}
variable "db_collation" {}