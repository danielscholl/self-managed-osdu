# Helm Chart for OSDU on Azure Core Services

| osdu-core_services  | app-version  |
| ------------------- | ----------   |
| 1.13.0               | 0.13.0        |
| 1.11.0               | 0.11.0        |
| 1.10.0               | 0.10.0        |
| 1.9.0               | 0.9.0        |
| 1.8.1               | 0.8.0        |
| 1.8.0               | 0.8.0        |
| 1.7.0               | 0.7.0        |
| 1.3.0               | 0.5.0        |
| 1.0.0               | 0.4.3        |


__Supported OSDU Services__

- [Storage Service](https://community.opengroup.org/osdu/platform/system/storage)
- [Schema Service](https://community.opengroup.org/osdu/platform/system/schema-service)
- [File Service](https://community.opengroup.org/osdu/platform/system/file)
- [Indexer Service](https://community.opengroup.org/osdu/platform/system/indexer-service)
- [Indexer Queue](https://community.opengroup.org/osdu/platform/system/indexer-queue)
- [Search Service](https://community.opengroup.org/osdu/platform/system/search-service)
- [Register Service](https://community.opengroup.org/osdu/platform/system/register)
- [Notification Service](https://community.opengroup.org/osdu/platform/system/notification)
- [Dataset Service](https://community.opengroup.org/osdu/platform/system/dataset)

## Install Process

Either manually modify the values.yaml for the chart or generate a custom_values yaml to use.

_The following commands can help generate a prepopulated custom_values file._
```bash
# Setup Variables
RAND="<your_random_value>"          # ie: jdfe
DNS_HOST="<your_osdu_fqdn>"         # ie: osdu-self-dpljdfe-4zis-gw.centralus.cloudapp.azure.com

GROUP=$(az group list --query "[?contains(name, 'cpl${RAND}')].name" -otsv)
ENV_VAULT=$(az keyvault list --resource-group $GROUP --query [].name -otsv)

# Translate Values File
cat > osdu_azure_custom_values.yaml << EOF
# This file contains the essential configs for the osdu on azure helm chart

################################################################################
# Specify the default replica count for each service.
#
replicaCount: 2

################################################################################
# Specify the azure environment specific values
#
azure:
  tenant: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/tenant-id --query value -otsv)
  subscription: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/subscription-id --query value -otsv)
  resourcegroup: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/base-name-cr --query value -otsv)-rg
  identity: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/base-name-cr --query value -otsv)-osdu-identity
  identity_id: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/osdu-identity-id --query value -otsv)
  keyvault: $ENV_VAULT
  appid: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/aad-client-id --query value -otsv)
  podIdentityAuthEnabled: false
  oidAuthEnabled: false # set this to true if you want to use oid instead of unique_name and upn

################################################################################
# Specify the Ingress Settings
#
ingress:
  issuer: letsencrypt-prod-dns
  dns: $DNS_HOST
  enableKeyvaultCert: false           # <- Set this to true in order to use your own keyvault cert
EOF

NAMESPACE=osdu-azure
kubectl create namespace $NAMESPACE && kubectl label namespace $NAMESPACE istio-injection=enabled

helm install core-services . -n $NAMESPACE -f osdu_azure_custom_values.yaml
```
