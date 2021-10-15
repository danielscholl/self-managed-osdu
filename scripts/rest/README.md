These are HTTP Rest Scripts that can make testing and executing API calls easier.  These scripts are compatable with the VS Code Extension [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).

[Rest Client Settings](https://github.com/Huachao/vscode-restclient#environment-variables) can be set to create environments and saved in [VS Code Settings](https://vscode.readthedocs.io/en/latest/getstarted/settings/).

__Create a Client Secret__

The application created for OSDU by default does not have a Client Secret and one must be manually created.

```bash
# This logs your local Azure CLI in using the configured service principal.
az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID

GROUP=$(az group list --query "[?contains(name, 'cr${UNIQUE}')].name" -otsv)
ENV_VAULT=$(az keyvault list --resource-group $GROUP --query [].name -otsv)

CLIENT_SECRET=$(az ad app credential reset --id $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/aad-client-id --query value -otsv) --query password -otsv)
```

