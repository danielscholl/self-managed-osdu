# Helm Chart for OSDU on Azure Airflow

__Version Tracking__

| Helm Chart Version | airflow     | statsd  |
| ------------------ | ----------- |-------- |
| `1.0.x`            | `7.5.0`     | `1.0.0` |


__Pull Helm Chart__

Helm Charts are stored in OCI format and stored in an Azure Container Registry for Convenience.

```bash
# Setup Variables
CHART=osdu-airflow
VERSION=1.0.9

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
UNIQUE="<your_osdu_unique>"               # ie: demo
DNS_HOST="<your_osdu_fqdn>"               # ie: osdu-$UNIQUE.contoso.com
AZURE_ENABLE_MSI="<true/false>"           # Should be kept as false mainly because for enabling MSI for S2S Authentication some extra pod identity changes are required

# This logs your local Azure CLI in using the configured service principal.
az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID

GROUP=$(az group list --query "[?contains(name, 'cr${UNIQUE}')].name" -otsv)
ENV_VAULT=$(az keyvault list --resource-group $GROUP --query [].name -otsv)

# This needs to be set to where OSDU is installed.
OSDU_NAMESPACE=osdu-azure

# Translate Values File
cat > osdu_airflow_custom_values.yaml << EOF
# This file contains the essential configs for the osdu on azure helm chart

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

################################################################################
# Specify any optional override values
#
airflowLogin:
  name: admin                 #<-- Default Airflow Web UI username

################################################################################
# Specify the airflow configuration override values
#
airflow:
  ingress:
    enabled: true           #<-- Set this to false to disable Admin UI ingress
    web:
      annotations:
        cert-manager.io/cluster-issuer: letsencrypt-prod-dns
        # Please uncomment below two lines and comment above line to use your own certificate from keyvault
        #cert-manager.io/cluster-issuer: null
        #appgw.ingress.kubernetes.io/appgw-ssl-certificate: "appgw-ssl-cert"
      host: $DNS_HOST
      tls:
        enabled: true    #<-- Set this to false to enable keyvault certificate
  externalDatabase:
    host: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/base-name-sr --query value -otsv)-pg.postgres.database.azure.com
    user:  osdu_admin@$(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/base-name-sr --query value -otsv)-pg
  externalRedis:
    host: $(az keyvault secret show --id https://${ENV_VAULT}.vault.azure.net/secrets/base-name-sr --query value -otsv)-cache.redis.cache.windows.net

  # The namespace needs to be set to where Airflow has been installed.
  airflow:
    extraEnv:
      - name: CLOUD_PROVIDER
        value: "azure"
      - name: AIRFLOW_VAR_KEYVAULT_URI
        valueFrom:
          configMapKeyRef:
            name: osdu-svc-config
            key: ENV_KEYVAULT
      - name: AIRFLOW__CORE__FERNET_KEY
        valueFrom:
          secretKeyRef:
            name: airflow
            key: fernet-key
      - name: AIRFLOW_CONN_AZ_LOG
        valueFrom:
          secretKeyRef:
            name: airflow
            key: remote-log-connection
      - name: AIRFLOW_VAR_AZURE_TENANT_ID
        valueFrom:
          secretKeyRef:
            name: active-directory
            key: tenantid
      - name: AIRFLOW_VAR_AZURE_CLIENT_ID
        valueFrom:
          secretKeyRef:
            name: active-directory
            key: principal-clientid
      - name: AIRFLOW_VAR_AZURE_CLIENT_SECRET
        valueFrom:
          secretKeyRef:
            name: active-directory
            key: principal-clientpassword
      - name: AIRFLOW_VAR_AAD_CLIENT_ID
        valueFrom:
          secretKeyRef:
            name: active-directory
            key: application-appid
      - name: AIRFLOW_VAR_APPINSIGHTS_KEY
        valueFrom:
          secretKeyRef:
            name: central-logging
            key: appinsights
      - name: AIRFLOW_VAR_AZURE_DNS_HOST
        value: $DNS_HOST
      - name: AIRFLOW_VAR_AZURE_ENABLE_MSI
        value: $AZURE_ENABLE_MSI
      # Needed for installing python osdu python sdk. In future this will be changed
      - name: CI_COMMIT_TAG
        value: "v0.11.0"
      - name: AIRFLOW_VAR_ENTITLEMENTS_MODULE_NAME
        value: "entitlements_client"
      - name: AIRFLOW_VAR_CORE__CONFIG__DATALOAD_CONFIG_PATH
        value: "/opt/airflow/dags/configs/dataload.ini"
      - name: AIRFLOW_VAR_CORE__SERVICE__SCHEMA__URL
        value:  "http://schema.${OSDU_NAMESPACE}.svc.cluster.local/api/schema-service/v1/schema"
      - name: AIRFLOW_VAR_CORE__SERVICE__SEARCH__URL
        value: "http://search.${OSDU_NAMESPACE}.svc.cluster.local/api/search/v2/query"
      - name: AIRFLOW_VAR_CORE__SERVICE__STORAGE__URL
        value:  "http://storage.${OSDU_NAMESPACE}.svc.cluster.local/api/storage/v2/records"
      - name: AIRFLOW_VAR_CORE__SERVICE__FILE__HOST
        value: "http://file.${OSDU_NAMESPACE}.svc.cluster.local/api/file/v2"
      - name: AIRFLOW_VAR_CORE__SERVICE__WORKFLOW__HOST
        value: "http://workflow.${OSDU_NAMESPACE}.svc.cluster.local/api/workflow"
      - name: AIRFLOW_VAR_CORE__SERVICE__SEARCH_WITH_CURSOR__URL
        value: "http://search.${OSDU_NAMESPACE}.svc.cluster.local/api/search/v2/query_with_cursor"
    extraConfigmapMounts:
        - name: remote-log-config
          mountPath: /opt/airflow/config
          configMap: airflow-remote-log-config
          readOnly: true
    extraPipPackages: [
        "flask-bcrypt==0.7.1",
        "apache-airflow[statsd]",
        "apache-airflow[kubernetes]",
        "apache-airflow-backport-providers-microsoft-azure==2021.2.5",
        "dataclasses==0.8",
        "google-cloud-storage",
        "python-keycloak==0.24.0",
        "msal==1.9.0",
        "azure-identity==1.5.0",
        "azure-keyvault-secrets==4.2.0",
        "azure-storage-blob",
        "azure-servicebus==7.0.1",
        "toposort==1.6",
        "strict-rfc3339==0.7",
        "jsonschema==3.2.0",
        "pyyaml==5.4.1",
        "requests==2.25.1",
        "tenacity==8.0.1",
        "https://azglobalosdutestlake.blob.core.windows.net/pythonsdk/osdu_api-0.11.0.tar.gz",
        "https://azglobalosdutestlake.blob.core.windows.net/pythonsdk/osdu_airflow-0.0.1.tar.gz"
    ]
    extraVolumeMounts:
        - name: azure-keyvault
          mountPath: "/mnt/azure-keyvault"
          readOnly: true
        - name: dags-data
          mountPath: /opt/airflow/plugins
          subPath: plugins
    extraVolumes:
        - name: azure-keyvault
          csi:
            driver: secrets-store.csi.k8s.io
            readOnly: true
            volumeAttributes:
              secretProviderClass: azure-keyvault

EOF
```


__Install Helm Chart__

Install the helm chart.

```bash
# Ensure your context is set.
# az aks get-credentials -n <your kubernetes service> --admin -g <resource group>

# Create Namespace
NAMESPACE=airflow
kubectl create namespace $NAMESPACE

# Install Charts
helm install airflow osdu-airflow -n $NAMESPACE -f osdu_airflow_custom_values.yaml
```


> Managing airflow users can be from within the Airflow UI or performed using the airflow command found in the running airflow web container.

  ```bash
  # Get Airflow web container
  # AIRFLOW_WEB_CONTAINER=$(kubectl get pod -n airflow | grep "web" | cut -f 1 -d " ")
  # Login to airflow web container.
  # kubectl exec --stdin --tty $AIRFLOW_WEB_CONTAINER -n airflow -- /bin/bash

  # Add a User
  USER_FIRST=<your_firstname>               # ie: admin
  USER_LAST=<your_last>                     # ie: admin
  EMAIL=<your_email>                        # ie: admin@email.com
  PASSWORD=<your_password>                  # ie: admin

  airflow create_user \
    --role Admin \
    --username $USER_FIRST \
    --firstname $USER_FIRST \
    --lastname $USER_LAST \
    --email $EMAIL \
    --password $PASSWORD


  ```

__Role based access to Airflow__

Airflow RBAC guide [here](https://community.opengroup.org/osdu/platform/deployment-and-operations/infra-azure-provisioning/-/blob/master/docs/airflow-rbac-guide.md).


