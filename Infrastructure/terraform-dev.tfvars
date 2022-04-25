/*
This file contains all the values for the variables defined in variables.tf
*/

# Variable values for Azure resource group
resource_group_name     = "ca-cn-dev-demo-rg" # This can also be stored in GitHub secrets
resource_group_location = "canadacentral"     # This can also be stored in GitHub secrets
environment             = "dev"               # This can also be stored in GitHub secrets

# Variable values for Kubernetes Cluster and Pool
cluster_name        = "ca-cn-dev-aks"
dns_prefix          = "aks-dns"
k8s_version         = "1.22.6"
node_pool_name      = "default"
node_pool_count     = 2
node_pool_vm_size   = "standard_b2ms"
node_pool_max_count = 5
node_pool_min_count = 1

k8s_type              = "VirtualMachineScaleSets" #Default is VirtualMachineScaleSets
node_pool_osdisk_size = 50
enable_auto_scaling   = false

# Variable values for Network Profile
network_plugin    = "kubenet"
load_balancer_sku = "Standard"

# Variable values for container registry
acr_name = "akscontainersreg"

# Variable values for Azure Database for PostgreSQL servers
sql_name = "ca-cn-dev-psql" # This can also be stored in GitHub secrets

sku_name       = "B_Gen5_1"
server_version = "11"
storage_mb     = 5120

# Expected backup_retention_days to be in the range (7 - 35)
backup_retention_days        = 7
geo_redundant_backup_enabled = false
auto_grow_enabled            = true

public_network_access_enabled    = true
ssl_enforcement_enabled          = true
ssl_minimal_tls_version_enforced = "TLS1_2"

sql_db_name  = "Test-dev-DB"
db_charset   = "UTF8"
db_collation = "ENGLISH_United States.1252"