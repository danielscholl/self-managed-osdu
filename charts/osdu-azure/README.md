# Helm Chart for OSDU on Azure

| `osdu-*-*`          | app-version  |
| ------------------- | ----------   |
| 1.11.0               | 0.11.0        |
| 1.10.0               | 0.10.0        |
| 1.9.0               | 0.9.0        |
| 1.8.1               | 0.8.0        |
| 1.8.0               | 0.8.0        |
| 1.7.1               | 0.7.0        |
| 1.4.0-rc1           | 0.6.0-rc1    |
| 1.3.1               | 0.5.0        |

__Pull Helm Chart__

Helm Charts are stored in OCI format and stored in an Azure Container Registry for Convenience.

```bash
# Setup Variables
CHART=osdu-azure
VERSION=1.11.0

# Pull Chart
helm chart pull msosdu.azurecr.io/helm/$CHART:$VERSION

# Export Chart
helm chart export msosdu.azurecr.io/helm/$CHART:$VERSION
```

__Create Helm Chart Values__

Either manually modify the values.yaml for the chart or generate a custom_values yaml to use.

_The following commands can help generate a prepopulated custom_values file._
```bash
# Setup Variables
UNIQUE="<your_osdu_unique>"         # ie: demo
DNS_HOST="<your_osdu_fqdn>"         # ie: osdu-$UNIQUE.contoso.com

# This logs your local Azure CLI in using the configured service principal.
az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID

GROUP=$(az group list --query "[?contains(name, 'cr${UNIQUE}')].name" -otsv)
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
```


__Install Helm Chart__

Install the helm chart.

```bash
# Ensure your context is set.
# az aks get-credentials -n <your kubernetes service> --admin -g <resource group>

# Create Namespace
NAMESPACE=osdu-azure
kubectl create namespace $NAMESPACE && kubectl label namespace $NAMESPACE istio-injection=enabled

# Install Charts
helm install partition-services osdu-azure/osdu-partition_base -n $NAMESPACE -f osdu_azure_custom_values.yaml
helm install security-services osdu-azure/osdu-security_compliance -n $NAMESPACE -f osdu_azure_custom_values.yaml
helm install core-services osdu-azure/osdu-core_services -n $NAMESPACE -f osdu_azure_custom_values.yaml
helm install reference-services osdu-azure/osdu-reference_helper -n $NAMESPACE -f osdu_azure_custom_values.yaml
helm install ingest-services osdu-azure/osdu-ingest_enrich -n $NAMESPACE -f osdu_azure_custom_values.yaml
```

__DDMS Moved__

The following services have been moved to new namespaces:
1. Seismic Store Service 
2. Wellbore DDMS 

Well Delivery DDMS is still in 'osdu' namespace

Click [here](osdu-ddms/README.md) for more information. 

__Optional Preview Features Helm Chart__

The following charts are `preview only` features and will require additional backend systems to support.

```bash
# Ensure your context is set.
# az aks get-credentials -n <your kubernetes service> --admin -g <resource group>

# Create Namespace
NAMESPACE=osdu-azure

# Install Charts
helm install opa osdu-azure/osdu-opa -n $NAMESPACE -f osdu_azure_custom_values.yaml
```
