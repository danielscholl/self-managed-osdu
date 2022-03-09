# Command line Validation

Better validation of an installation can occur with direct access to AKS using `kubectl` and `flux` commands.

__Validate the osdu-stamp Kustomization__

```bash
flux get kustomizations

## RESULTS ##
NAME          	READY	MESSAGE                                                        	REVISION                                     	SUSPENDED
flux-system   	True 	Applied revision: main/365784399be9b4de1b8d2e3fb8627dcd8a1ab44d	main/365784399be9b4de1b8d2e3fb8627dcd8a1ab44d	False
osdu-stamp    	True 	Applied revision: main/365784399be9b4de1b8d2e3fb8627dcd8a1ab44d	main/365784399be9b4de1b8d2e3fb8627dcd8a1ab44d	False
sealed-secrets	True 	Applied revision: main/365784399be9b4de1b8d2e3fb8627dcd8a1ab44d	main/365784399be9b4de1b8d2e3fb8627dcd8a1ab44d	False
```

__Validate the running osdu service pods__

```bash
kubectl get pods -n osdu-azure

## RESULTS ##
NAME                              READY   STATUS    RESTARTS   AGE
crs-catalog-7f68b94695-lkbrv      2/2     Running   0          50m
crs-catalog-7f68b94695-pkb5t      2/2     Running   0          50m
crs-conversion-86898c7f66-9bbnb   2/2     Running   0          38m
crs-conversion-86898c7f66-cftp2   2/2     Running   0          38m
dataset-64bc966f6d-tvbjp          2/2     Running   0          44m
dataset-64bc966f6d-z2qs2          2/2     Running   0          44m
default-59f89b9884-b6vps          1/1     Running   0          59m
entitlements-c74b67857-q8mz8      2/2     Running   0          50m
entitlements-c74b67857-tlgx5      2/2     Running   0          50m
file-5559d4495b-5nglb             2/2     Running   0          44m
file-5559d4495b-xzf5q             2/2     Running   0          44m
indexer-f5b7744dc-vfdcj           2/2     Running   0          47m
indexer-f5b7744dc-ww2c8           2/2     Running   0          46m
indexer-queue-8448965ffb-vts24    2/2     Running   0          42m
legal-7bd5ccc79c-6hn27            2/2     Running   0          50m
legal-7bd5ccc79c-vshzd            2/2     Running   0          50m
notification-db66d88f-6796p       2/2     Running   0          47m
notification-db66d88f-ccnr7       2/2     Running   0          47m
partition-6495dc7d-7djxn          2/2     Running   0          52m
partition-6495dc7d-wf587          2/2     Running   0          52m
register-5fdcb5bbcf-mwwmb         2/2     Running   0          47m
register-5fdcb5bbcf-vb6mk         2/2     Running   0          47m
schema-bd79f9777-8lvjr            2/2     Running   0          44m
schema-bd79f9777-jd8fw            2/2     Running   0          44m
search-98f6d5fb-khdhv             2/2     Running   0          45m
search-98f6d5fb-z2vt4             2/2     Running   0          45m
storage-74788f7c88-2l49d          2/2     Running   0          47m
storage-74788f7c88-llb6z          2/2     Running   0          47m
unit-ff6db89d5-9k2gn              2/2     Running   0          38m
unit-ff6db89d5-sxplz              2/2     Running   0          38m
wks-75bd49f596-86vrn              2/2     Running   0          42m
wks-75bd49f596-q89tp              2/2     Running   0          42m
workflow-785bbfb659-4zq58         2/2     Running   0          42m
workflow-785bbfb659-tqfpq         2/2     Running   0          42m
```

__Validate succesful helm chart reconciliation__

```bash
flux get helmreleases -A

## RESULTS ##
NAMESPACE   	NAME                	READY	MESSAGE                         	REVISION	SUSPENDED
airflow     	airflow-base        	True 	Release reconciliation succeeded	1.0.4   	False
default     	osdu-base           	True 	Release reconciliation succeeded	1.0.0   	False
dev-sample  	env-tool            	True 	Release reconciliation succeeded	0.0.1   	False
dev-sample  	token-service       	True 	Release reconciliation succeeded	0.13.0  	False
flux-system 	sealed-secrets      	True 	Release reconciliation succeeded	1.16.1  	False
istio-system	istio-base          	True 	Release reconciliation succeeded	1.1.0   	False
istio-system	istio-operator      	True 	Release reconciliation succeeded	1.7.0   	False
istio-system	osdu-istio          	True 	Release reconciliation succeeded	1.1.3   	False
osdu-azure  	crs-catalog         	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	crs-conversion      	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	dataset-service     	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	default-service     	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	entitlement-service 	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	file-service        	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	indexer-queue       	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	indexer-service     	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	legal-service       	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	notification-service	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	partition-service   	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	register-service    	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	schema-service      	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	search-service      	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	self-managed-base   	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	storage-service     	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	unit-service        	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	wks-service         	True 	Release reconciliation succeeded	0.13.0  	False
osdu-azure  	workflow-service    	True 	Release reconciliation succeeded	0.13.0  	False
```

## Common Issues

There appears to be timing problems with Flux that causes the helmrelease to at times not move to a completed state.  The services start, but the helmrelease never moves to a reconciled.  The following is a list of the services that are not completed.

The following command shows the status of the OSDU Services installation.

```bash
flux get helmreleases -A -n osdu-azure

## RESULTS ###
NAMESPACE   	NAME                	READY  	MESSAGE                                                                         	REVISION	SUSPENDED
<snip>
osdu-azure  	file-service        	False  	Helm upgrade failed: another operation (install/upgrade/rollback) is in progress	        	False
<snip>
```

This can be easily resolved by deleting the helmrelease and triggering a reconcile process on the kustomization.

```bash
flux delete helmrelease <service_name> -n osdu-azure
flux delete helmrelease <service_name> -n osdu-azure
flux reconcile kustomization osdu-stamp
```
