# Self Managed OSDU

This is a prototype used to evaluate the possibility of providing an easy self managed instance of [OSDU on Azure](https://community.opengroup.org/osdu/platform/deployment-and-operations/infra-azure-provisioning) to ease the development experience of developing components or extensions that might run on top or inside of the OSDU Platform that runs in Azure.

__Goals:__

1. Build an automation layer on top of OSDU on Azure without impacting the official OSDU Platform.
2. Ease the amount of required knowledge needed to deploy the platform.
3. Allow for customizations and configuration.
4. Provide access to and control of all software components installed.


__Architecture:__

The  Architecture is based on the OSDU on Azure [Reference Architecture](https://community.opengroup.org/osdu/platform/deployment-and-operations/infra-azure-provisioning/-/tree/master#cloud-resource-architecture) but an additional diagram is provided to help visualize the architecture [here](./docs/images/architecture.png).


## Initialize the project

The solution is designed to operate from a fork instance of this project.

1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) the Project into your own GitHub Organization.
2. Edit the Configuration Settings. _([Configuration](configuration))_
3. Add any customizations (Optional) _([Customizations](customizations))_



## Configure GitHub Secrets

Secrets are managed using [Github Repository Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets) some secrets are required to be created manually while others are created automatically by running [Github Actions](https://docs.github.com/en/actions).

__Manually Created Secrets__

1. `GH_REPO_TOKEN`: A personal access token with `repo` scope.
2. `AZURE_LOCATION`: The Azure Region to deploy the resources to.
3. `AZURE_CREDENTIALS`: The json output of a Service Principal with _Owner_ Subscription Scope.

```bash
SUBSCRIPTION_ID=$(az account show --query id --output tsv)
AZURE_CREDENTIALS="self-managed-osdu-azure-credentials-$(az account show --query user.name -otsv | awk -F "@" '{print $1}')"

az ad sp create-for-rbac --name $AZURE_CREDENTIALS \
  --role "Owner" \
  --scopes /subscriptions/$SUBSCRIPTION_ID \
  --sdk-auth \
  -ojson

# Sample Format
{
  "clientId": "00000000-0000-0000-0000-000000000000",                       # Client ID GUID
  "clientSecret": "**********************************",                     # Client Secret
  "subscriptionId": "00000000-0000-0000-0000-000000000000",                 # Subscription ID GUID
  "tenantId": "00000000-0000-0000-0000-000000000000",                       # Tenant ID GUID
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

4. `OSDU_CREDENTIALS`: The json output a Service Principal with _Contributor_ Subscription Scope.

```bash
SUBSCRIPTION_ID=$(az account show --query id --output tsv)
OSDU_CREDENTIALS="self-managed-osdu-stamp-credentials-$(az account show --query user.name -otsv | awk -F "@" '{print $1}')"

az ad sp create-for-rbac --name $OSDU_CREDENTIALS \
  --role "Contributor" \
  --scopes /subscriptions/$SUBSCRIPTION_ID \
  --sdk-auth \
  -ojson

# Sample Format
{
  "clientId": "00000000-0000-0000-0000-000000000000",                       # Client ID GUID
  "clientSecret": "**********************************",                     # Client Secret
  "subscriptionId": "00000000-0000-0000-0000-000000000000",                 # Subscription ID GUID
  "tenantId": "00000000-0000-0000-0000-000000000000",                       # Tenant ID GUID
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

5. `OSDU_CREDENTIAL_OID`: The Object ID of the _OSDU_CREDENTIALS_ Service Principal.

```bash
az ad sp list --display-name $OSDU_CREDENTIALS --query [].objectId -otsv
```

6. `OSDU_APPLICATION`: The json output of an Azure AD Application.

```bash
OSDU_APPLICATION="self-managed-osdu-stamp-application-$(az account show --query user.name -otsv | awk -F "@" '{print $1}')"

az ad app create --display-name $OSDU_APPLICATION \
  --oauth2-allow-implicit-flow \
  --required-resource-accesses @configuration/manifest.json \
  --query '{appId:appId, displayName:displayName, objectId:objectId}' \
  -ojson


  # Sample Format
{
  "appId": "00000000-0000-0000-0000-000000000000",
  "displayName": "osdu-application",
  "objectId": "00000000-0000-0000-0000-000000000000"
}
```

__Generated Secrets__

1. `RAND`: Unique Random String - Created by Action `Stamp Initialize'
2. `SSH_PASSPHRASE`: AKS SSH Key - Created by Action `Stamp Initialize'
3. `SSH_PRIVATE_KEY`: AKS SSH Key - Created by Action `Stamp Initialize'
4. `SSH_PUBLIC_KEY`: AKS SSH Key - Created by Action `Stamp Initialize'
5. `BUILDER_GROUP`: Resource Group Name - Created by Action `Stamp Builder'


## Github Actions

Deployment of a self managed osdu instance is performed by executing github actions to work with a [Deployment Stamp](https://docs.microsoft.com/en-us/azure/architecture/patterns/deployment-stamp).  Currently there is only support for the deployment of 1 stamp.


1. __[Stamp Initialize](../../actions/workflows/stamp-init.yaml)__: This action initializes any neccesary items in github that are necessary to begin (ie: Randomizer Secrets, ssh keys). _(Time: ~30s)_

2. __[Stamp Builder](../../actions/workflows/stamp-builder.yaml)__: This action provisions resources necessary to support a provisioning process (ie: Terraform State and Secret Storage). _(Time: ~3m)_

3. __[Stamp Provision](../../actions/workflows/stamp-provision.yaml)__: This action provisions resources for the Deployment Stamp.  _(Time: ~1h)_

4. __[Stamp Install](../../actions/workflows/stamp-configure.yaml)__: This action initializes the Software Configuration process of the Deployment Stamp and the software deployment occurs after pipeline completion.  _(Time: ~20m)_

> Note: Prior to running the Stamp Load due to a recent change in Azure AD Applications the AD Application needs to be approved for access.  This can be done by accessing the Login Page. Access the $DNS_HOST/login

5. __[Stamp Load](../../actions/workflows/stamp-load.yaml)__: This action initializes the partition and loads the necessary data into the Stamp to allow it to fully function. (ie: Entitlements, Schemas, Workflow)  _(Time: ~20m)_

6. __[Stamp Uninstall](../../actions/workflows/stamp-uninstall.yaml)__: This action uninstalls the OSDU Stamp and requires Github Secrets used as Feature Flags to enable the activity.

  - Secret: UNINSTALL - This secret will trigger the feature flag to perform a software uninstall.
  - Secret: REMOVE - This secret will trigger the feature flag to delete the entire Stamp. (Locks must be manually removed first)

## Provisioned Resources

The following resources are created in Azure for a Deployment Stamp.

__[Builder](./docs/images/builder.png)__

1. Azure Key Vault (Standard)
2. Azure Storage Account - Table (StorageV2-LRS)

__[Control Plane](./docs/images/controlplane.png)__

1. Log Analytics Workspace - 2 Solutions - Container & KeyVault (Pay-as-you-go)
2.  Application Insights (Pay-as-you-go)
3. Azure Key Vault (Standard)
4. Azure Storage Account - Table (StorageV2-LRS)
5. Azure Cosmos DB Account - Gremlin (4000 Max RU's - Shared)
6. Azure Container Registry - (Standard)
7. User Managed Identity

__[Data Plane](./docs/images/dataplane.png)__

1. Azure Virtual Network
2. Azure Storage Account - Qty2 (StorageV2-LRS)
4. Event Grid System Topic
5. Application Gateway - (WAFv2 w/ Autoscale (2-10))
6. Public IP Address
7. Azure Database for Postgres (General Purpose - 4vCore 5GB)
8. Azure Cosmos DB Account - Core (4000 Max RU's - Shared)
9. Azure Cache for Redis (Standard 1Gb)
10. Azure Kubernetes Service - System NodePool (2 Standard_E4s_v3), User NodePool (5-10 Standard_E4s_v3)
11. User Managed Identity - Qty3

__[Data Partition](./docs/images/partition.png)__

1. Service Bus Namespace (Standard)
2. Event Grid Domain w/ 5 Topics (Basic)
3. Azure Cosmos DB Account - Core (12000 Max RU's - Shared)
4. Azure Storage Account - Qty2 (StorageV2-GZRS)


## Platform Access

__Service Validation__

Verify the `osdu-azure` services have successfully started.

Services can be seen by looking in the Azure Portal at the [AKS Workloads](https://docs.microsoft.com/en-us/azure/aks/kubernetes-portal)under the namespace [osdu-azure](./docs/images/deployments.png).

To optionally further validate a deployment you will need access to the AKS cluster via command line. Please refer to [cli-validation](./docs/cli-validation.md) for more information.


__API Endpoint Validation__

Verify the `self-managed-osdu` instance is available by accessing the [Data Platform Endpoint](./docs/images/default_web.png).

The API endpoint DNS name can be found by looking in the Azure Portal at the DNS of the [Public IP Address](./docs/images/access.png).


__AD Application Configuration__

The [OSDU Stamp AD Application](/docs/images/authenticate.png) must have the platform settings configured as a [Web Platform](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app#configure-platform-settings).



## API Requests

The simpliest way to execute against the Platform is to leverage the HTTP Rest Scripts that make testing and executing API calls easier.  These scripts are compatable with the VS Code Extension [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).

[Rest Client Settings](https://github.com/Huachao/vscode-restclient#environment-variables) can be set to create environments and saved in [VS Code Settings](https://vscode.readthedocs.io/en/latest/getstarted/settings/).


__Retrieve the Rest Client Environment Settings__

For convenience the Rest Client Environment Settings can be retrieved from the `builder` keyvault in the secret `restclient`. To access secrets from the portal an [access policy](https://docs.microsoft.com/en-us/azure/key-vault/general/assign-access-policy?tabs=azure-portal) must be setup first.

This json snippet can then be placed in the `.vscode/settings.json` file along with a required AD Application `Client Secret` that is used to authenticate the Rest Client.


__Configure RBAC Access__

Add a User and entitle the user to the ops group.  This can be done by running the [manage-user.http](./scripts/rest/manage-user.http) script.

1. Modify the @member_email value [(Line 69)](https://github.com/danielscholl-demo/self-managed-osdu/blob/main/scripts/rest/manage-user.http#L69)
2. Execute createUser [(Line 78)](https://github.com/danielscholl-demo/self-managed-osdu/blob/main/scripts/rest/manage-user.http#L78)
3. Execute assignMemberToOpsGroup [(Line 158)](https://github.com/danielscholl-demo/self-managed-osdu/blob/main/scripts/rest/manage-user.http#L158)


__Generate an OpenID Connect Token__

An initial `refresh_token` has to be configured and added to the resetclient_settings file as the `initial_token`.

1. Access the $DNS_HOST/login page of the platform and obtain an authorization token. [image](./docs/images/login.png)
2. Add the authorization token to the [auth_token.http](./scripts/rest/auth-token.http) file. [(Line 7)](https://github.com/danielscholl-demo/self-managed-osdu/blob/main/scripts/rest/auth-token.http#L7)  [image](./docs/images/auth_token.png)
3. Execute authorize [(Line 13)](https://github.com/danielscholl-demo/self-managed-osdu/blob/main/scripts/rest/auth-token.http#L13)
4. Add the refresh token to the restclient_settings file.


__Execute Check Scripts__

1. Check Core API [check_core.http](./scripts/rest/check_core.http)
2. Check File Upload [check_file.http](./scripts/rest/check_file.http)
3. Check Manifest Ingest [check_manifest.http](./scripts/rest/check_manifest.http)
4. Check CSV Ingest [check_csv.http](./scripts/rest/check_csv.http)
