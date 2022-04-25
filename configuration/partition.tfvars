/*
.Synopsis
   Terraform Variable Override Template
.DESCRIPTION
   This file holds a sample of variable overrides to be used by pipelines
*/

/* The following items are recommended to override in custom.tfvars
  1. Resource Tags
*/

prefix = "osdu-self"

resource_tags = {
  environment = "Self Managed OSDU"
  contact = "mpcheema"
  repo = "https://github.com/mpcheema/self-managed-osdu"
}

data_partition_name = "opendes"


# Storage Settings
storage_replication_type = "GZRS"
sa_retention_days        = 30


# Database Settings
cosmosdb_consistency_level = "Session"
cosmos_databases = [
  {
    name       = "osdu-db"
    throughput = 12000
  }
]
cosmos_sql_collections = [
  {
    name                  = "LegalTag"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "StorageRecord"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "StorageSchema"
    database_name         = "osdu-db"
    partition_key_path    = "/kind"
    partition_key_version = null
  },
  {
    name                  = "TenantInfo"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "UserInfo"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "Authority"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null

  },
  {
    name                  = "EntityType"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "SchemaInfo"
    database_name         = "osdu-db"
    partition_key_path    = "/partitionId"
    partition_key_version = null
  },
  {
    name                  = "Source"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "RegisterAction"
    database_name         = "osdu-db"
    partition_key_path    = "/dataPartitionId"
    partition_key_version = null
  },
  {
    name                  = "RegisterDdms"
    database_name         = "osdu-db"
    partition_key_path    = "/dataPartitionId"
    partition_key_version = null
  },
  {
    name                  = "RegisterSubscription"
    database_name         = "osdu-db"
    partition_key_path    = "/dataPartitionId"
    partition_key_version = null
  },
  {
    name                  = "IngestionStrategy"
    database_name         = "osdu-db"
    partition_key_path    = "/workflowType"
    partition_key_version = null
  },
  {
    name                  = "RelationshipStatus"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "MappingInfo"
    database_name         = "osdu-db"
    partition_key_path    = "/sourceSchemaKind"
    partition_key_version = null
  },
  {
    name                  = "FileLocationEntity"
    database_name         = "osdu-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "WorkflowCustomOperatorInfo"
    database_name         = "osdu-db"
    partition_key_path    = "/operatorId"
    partition_key_version = null
  },
  {
    name                  = "WorkflowV2"
    database_name         = "osdu-db"
    partition_key_path    = "/partitionKey"
    partition_key_version = 2
  },
  {
    name                  = "WorkflowRunV2"
    database_name         = "osdu-db"
    partition_key_path    = "/partitionKey"
    partition_key_version = 2
  },
  {
    name                  = "WorkflowCustomOperatorV2"
    database_name         = "osdu-db"
    partition_key_path    = "/partitionKey"
    partition_key_version = 2
  },
  {
    name                  = "WorkflowTasksSharingInfoV2"
    database_name         = "osdu-db"
    partition_key_path    = "/partitionKey"
    partition_key_version = 2
  },
]
