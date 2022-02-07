# Customizations

These files are used to customize and override any OSDU on Azure Terraform Components.

## Manually Test and Create Customizations

### Open VS Code in Container

The solution leverages [Visual Studio Code Remote - Containers](https://code.visualstudio.com/docs/remote/containers) to deploy the infrastructure.

Open the solution with VSCode `Reopen in Container` and login to the Azure CLI

> This process requires the logged in user to have access to common keyvault secrets and the storage account.

```bash
# Login to Azure CLI and set the subscription.
az login
az account set --subscription <your_subscription>
```


### Required Common Environment Variables

__Environment Variables__

The following variables are required to support this solution.

| name                          | description                |
| ----------------------------- | -------------------------- |
| ARM_TENANT_ID                 | Azure AD Tenant Id         |
| ARM_SUBSCRIPTION_ID           | Azure Subscription Id      |
| ARM_CLIENT_ID                 | Terraform Principal Id     |
| ARM_CLIENT_SECRET             | Terraform Principal Secret |
| ARM_ACCESS_KEY                | Storage Account Access Key |
| TF_VAR_remote_state_account   | Storage Account Name       |
| TF_VAR_remote_state_container | Storage Account Container  |
| TF_VAR_cosmosdb_replica_location   | The Region Pair Location for DR Replication  |
| TF_VAR_principal_appId             | Environment Principal App Id                 |
| TF_VAR_principal_name              | Environment Principal Name                   |
| TF_VAR_principal_password          | Environment Principal Secret                 |
| TF_VAR_principal_objectId          | Environment Principal Object Id              |
| TF_VAR_aad_clientId                | Environment Application Id                   |
| `TF_VAR_elasticsearch_endpoint`    | `Environment Elastic Search Endpoint`        |
| TF_VAR_elasticsearch_username      | Environment Elastic Search UserName          |
| `TF_VAR_elasticsearch_password`    | `Environment Elastic Search Password`        |
| TF_VAR_gitops_ssh_url              | Environment GitOps SSH URL                   |
| TF_VAR_ssh_public_key_file         | Environment AKS Node SSH Public Key File     |
| TF_VAR_gitops_ssh_key_file         | Environment GitOps SSH Private Key File      |

> Note: Elastic search information needs to be manually configured.

```bash
# Download and set the environment variables
VAULT=<your_builder_vault>
az keyvault secret show --id https://$VAULT.vault.azure.net/secrets/envrc --query value -otsv > .envrc

# Allow environment variable loading
direnv allow
```

__SSH Keys__

Retrieve the required environment SSH Keys

```bash
export SSH_DIR='.ssh'
mkdir $SSH_DIR

## Download SSH Keys ##
az storage file download-batch \
  --account-key $(az keyvault secret show --id https://$VAULT.vault.azure.net/secrets/storage-key --query value -otsv) \
  --account-name $(az keyvault secret show --id https://$VAULT.vault.azure.net/secrets/storage --query value -otsv) \
  --source ssh-keys \
  --destination $SSH_DIR
```


__Infrastructure Deployment__

Provision the infrastructure using the terraform.sh wrapper.

```bash
RAND=<your_unique_string>

## Install the Central Resources ##
export TF_VAR_workspace="cpl-${RAND}" && cd /osdu-azure/templates/osdu-r3-mvp/central_resources
terraform.sh show  # Show the Terraform Plan
terraform.sh run   # Apply the Terraform Plan

## Install the Service Resources ##
export TF_VAR_central_resources_workspace_name="cpl-${RAND}"
export TF_VAR_gitops_ssh_key_file="/osdu-azure/.ssh/azure-aks-node-ssh-key"
export TF_VAR_workspace="dpl-${RAND}" && cd /osdu-azure/templates/osdu-r3-mvp/service_resources
terraform.sh show  # Show the Terraform Plan
terraform.sh run   # Apply the Terraform Plan

## Install the Data Partition ##
export TF_VAR_service_resources_workspace_name="dpl-${RAND}"
export TF_VAR_workspace="prt-${RAND}" && cd /osdu-azure/templates/osdu-r3-mvp/data_partition
terraform.sh show  # Show the Terraform Plan
terraform.sh run   # Apply the Terraform Plan
