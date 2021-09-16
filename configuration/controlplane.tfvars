/*
.Synopsis
   Terraform Variable Override Template
.DESCRIPTION
   This file holds a sample of variable overrides to be used by pipelines
*/


prefix = "osdu-self"

resource_tags = {
  environment = "Self Managed OSDU"
}

feature_flag = {
  acr_lock = false
  kv_lock  = false
}
