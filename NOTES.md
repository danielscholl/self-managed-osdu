# Uninstall Procedure

To uninstall the application, run the following command:

```bash
# Suspend and remove kustomizations
flux suspend kustomization flux-system

# Remove Helmreleases
flux delete helmrelease wks-service -n osdu-azure --silent
flux delete helmrelease crs-catalog -n osdu-azure --silent
flux delete helmrelease crs-conversion -n osdu-azure --silent
flux delete helmrelease unit-service -n osdu-azure --silent
flux delete helmrelease register-service -n osdu-azure --silent
flux delete helmrelease notification-service -n osdu-azure --silent
flux delete helmrelease search-service -n osdu-azure --silent
flux delete helmrelease indexer-queue -n osdu-azure --silent
flux delete helmrelease indexer-service -n osdu-azure --silent
flux delete helmrelease storage-service -n osdu-azure --silent
flux delete helmrelease dataset-service -n osdu-azure --silent
flux delete helmrelease file-service -n osdu-azure --silent
flux delete helmrelease schema-service -n osdu-azure --silent
flux delete helmrelease legal-service -n osdu-azure --silent
flux delete helmrelease entitlement-service -n osdu-azure --silent
flux delete helmrelease partition-service -n osdu-azure --silent
flux delete helmrelease default-service -n osdu-azure --silent

flux delete helmrelease self-managed-base -n osdu-azure --silent

flux delete helmrelease token-service -n dev-sample --silent
flux delete helmrelease env-tool -n dev-sample --silent

flux delete helmrelease airflow -n airflow --silent
flux delete helmrelease airflow-base -n airflow --silent

flux delete helmrelease osdu-base -n default --silent

flux delete helmrelease osdu-istio -n istio-system --silent
flux delete helmrelease istio-operator -n istio-system --silent
flux delete helmrelease istio-base -n istio-system --silent

flux delete helmrelease sealed-secrets -n flux-system --silent

kubectl delete CustomResourceDefinition istiooperators.install.istio.io --ignore-not-found=true

kubectl delete namespace osdu-azure
kubectl delete namespace dev-sample
kubectl delete namespace airflow
kubectl delete namespace istio-system

flux delete kustomization osdu-stamp --silent
flux delete kustomization sealed-secrets --silent

# If an istio clean up issue occurs then cleanup of the istio-system namespace.
kubectl get namespace "istio-system" -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/istio-system/finalize -f -

# Uninstall Flux
flux uninstall

# Cleanup Git
rm -rf clusters/osdu-stamp
rm -rf apps/osdu-stamp
git commit -am "Reset"
git push
```
