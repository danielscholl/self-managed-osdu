# Uninstall Procedure

To uninstall the application, run the following command:

```bash
flux delete kustomization osdu-stamp

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
