# Helm Chart for OSDU Airflow

__Create a Custom Values__

_The following commands can help generate a prepopulated custom_values file._
```bash
# Setup Variables
RAND="<your_random_value>"               # ie: dfba

GROUP=$(az group list --query "[?contains(name, 'cpl${UNIQUE}')].name" -otsv)
ENV_VAULT=$(az keyvault list --resource-group $GROUP --query [].name -otsv)

# Translate Values File
cat > custom_values.yaml << EOF
replicaCount: 1

nameOverride: ""
fullnameOverride: ""

service:
  type: ClusterIP
  targetPort: 8125


################################################################################
# Specify the azure environment specific values
#
azure:
  enabled: true
  tenant: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/tenant-id --query value -otsv)
  subscription: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/subscription-id --query value -otsv)
  resourcegroup: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/base-name-cr --query value -otsv)-rg
  identity: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/base-name-cr --query value -otsv)-osdu-identity
  identity_id: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/osdu-identity-id --query value -otsv)
  keyvault: $ENV_VAULT
  appid: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/aad-client-id --query value -otsv)

EOF


__Install Helm Chart__

Install the helm chart.

```bash
# Create Namespace
NAMESPACE=osdu-airflow
kubectl create namespace $NAMESPACE

# Install Charts
helm install osdu-airflow . -n $NAMESPACE -f custom_values.yaml
```
