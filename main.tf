/*
The source argument in a module block tells Terraform where to find the source code for the desired child module.
Terraform uses this during the module installation step of terraform init to download the source code to a directory on local disk so that it can be used by other Terraform commands.
*/
#
# Module for deploying Azure Kubernetes
module "setup_azure_kubernetes" {
  source                  = "github.com/terenceluk/terraform-modules//Modules/AKS" # Public repository with subfolders - note the //
  cluster_name            = var.cluster_name
  enable_auto_scaling     = var.enable_auto_scaling
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  dns_prefix              = "${var.environment}-${var.dns_prefix}" # Uses the values defined in .tfvars so the dev, stg, and prod environments have unique K8s dns_prefixes
  node_pool_name          = var.node_pool_name
  node_pool_count         = var.node_pool_count
  node_pool_vm_size       = var.node_pool_vm_size
  node_pool_osdisk_size   = var.node_pool_osdisk_size
  node_pool_max_count     = var.node_pool_max_count
  node_pool_min_count     = var.node_pool_min_count
  network_plugin          = var.network_plugin
  load_balancer_sku       = var.load_balancer_sku
  env                     = var.environment # Pass the environment dev, stg or prod so it can be used to tag Azure resource
  client_id               = var.client_id
  client_secret           = var.client_secret
  k8s_version             = var.k8s_version
  k8s_type                = var.k8s_type
}

# Module for deploying Azure Container Registry
module "setup_container_registry" {
  source                  = "github.com/terenceluk/terraform-modules//Modules/ACR" # Public repository with subfolders - note the //
  acr_name                = var.acr_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

# Module for deploying Azure Database for PostgreSQL servers 
module "setup_db_postgresql" {
  source                        = "github.com/terenceluk/terraform-modules//Modules/PostgreSQL" # Public repository with subfolders - note the //
  sql_name                      = var.sql_name
  server_version                = var.server_version
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  ssl_enforcement_enabled       = var.ssl_enforcement_enabled
  public_network_access_enabled = var.public_network_access_enabled
  storage_mb                    = var.storage_mb
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  backup_retention_days         = var.backup_retention_days
  sku_name                      = var.sku_name
  administrator_login_password  = var.administrator_login_password # This is not stored in .tfvars but rather stored in GitHub secrets
  db_charset                    = var.db_charset
  sql_db_name                   = var.sql_db_name
  db_collation                  = var.db_collation
  auto_grow_enabled             = var.auto_grow_enabled
  admin_login                   = var.admin_login     # This is not stored in .tfvars but rather stored in GitHub secrets
  subscription_id               = var.subscription_id # This is not stored in .tfvars but rather stored in GitHub secrets
  client_id                     = var.client_id       # This is not stored in .tfvars but rather stored in GitHub secrets
  client_secret                 = var.client_secret   # This is not stored in .tfvars but rather stored in GitHub secrets
  tenant_id                     = var.tenant_id       # This is not stored in .tfvars but rather stored in GitHub secrets
}