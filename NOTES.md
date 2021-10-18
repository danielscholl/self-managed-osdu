# Uninstall Procedure

To uninstall the application, run the following command:

```bash
flux delete kustomization osdu-stamp

# Remove Helmreleases
flux delete helmrelease crs-catalog -n osdu-stamp --silent
flux delete helmrelease crs-conversion -n osdu-stamp --silent
flux delete helmrelease unit-service -n osdu-stamp --silent
flux delete helmrelease register-service -n osdu-stamp --silent
flux delete helmrelease notification-service -n osdu-stamp --silent
flux delete helmrelease search-service -n osdu-stamp --silent
flux delete helmrelease indexer-queue -n osdu-stamp --silent
flux delete helmrelease indexer-service -n osdu-stamp --silent
flux delete helmrelease storage-service -n osdu-stamp --silent
flux delete helmrelease dataset-service -n osdu-stamp --silent
flux delete helmrelease file-service -n osdu-stamp --silent
flux delete helmrelease schema-service -n osdu-stamp --silent
flux delete helmrelease legal-service -n osdu-stamp --silent
flux delete helmrelease entitlement-service -n osdu-stamp --silent
flux delete helmrelease partition-service -n osdu-stamp --silent
flux delete helmrelease default-service -n osdu-stamp --silent
flux delete helmrelease token-service -n osdu-stamp --silent
flux delete helmrelease env-tool -n osdu-stamp --silent
flux delete helmrelease osdu-base -n osdu-stamp --silent
flux delete helmrelease self-managed-base -n osdu-stamp --silent
flux delete helmrelease istio-operator -n osdu-stamp --silent
flux delete helmrelease istio-base -n osdu-stamp --silent
flux delete helmrelease osdu-istio -n osdu-stamp --silent
flux delete helmrelease sealed-secrets -n osdu-stamp --silent




# An istio clean up issue requires cleanup of the istio-system namespace.
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
