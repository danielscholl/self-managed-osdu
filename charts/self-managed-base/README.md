
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
cat > custom_values.yaml << EOF
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
EOF

NAMESPACE=osdu-azure
helm template self-managed-osdu-base . -n $NAMESPACE -f custom_values.yaml
```

