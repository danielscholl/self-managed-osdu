
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
EOF

NAMESPACE=osdu-azure
helm template self-managed-osdu-service . -n $NAMESPACE -f custom_values.yaml
```

