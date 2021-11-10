# Airflow User Setup

There appears to be timing problems with Flux that causes the helmrelease to not move to a completed state.  The services start, but the helmrelease never moves to a reconciled.  The following is a list of the services that are not completed.

The following command shows the status of the OSDU Services installation.

```bash
flux get helmreleases -A -n osdu-azure

## RESULTS ###
NAMESPACE   	NAME                	READY  	MESSAGE                                                                         	REVISION	SUSPENDED
airflow     	airflow-base        	True   	Release reconciliation succeeded                                                	1.0.4   	False
default     	osdu-base           	True   	Release reconciliation succeeded                                                	1.0.0   	False
dev-sample  	env-tool            	True   	Release reconciliation succeeded                                                	0.0.1   	False
dev-sample  	token-service       	True   	Release reconciliation succeeded                                                	0.11.0  	False
flux-system 	sealed-secrets      	True   	Release reconciliation succeeded                                                	1.16.1  	False
istio-system	istio-base          	True   	Release reconciliation succeeded                                                	1.1.0   	False
istio-system	istio-operator      	True   	Release reconciliation succeeded                                                	1.7.0   	False
istio-system	osdu-istio          	True   	Release reconciliation succeeded                                                	1.1.3   	False
osdu-azure  	crs-catalog         	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	crs-conversion      	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	dataset-service     	Unknown	Reconciliation in progress                                                      	        	False
osdu-azure  	default-service     	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	entitlement-service 	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	file-service        	False  	Helm upgrade failed: another operation (install/upgrade/rollback) is in progress	        	False
osdu-azure  	indexer-queue       	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	indexer-service     	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	legal-service       	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	notification-service	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	partition-service   	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	register-service    	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	schema-service      	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	search-service      	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	self-managed-base   	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	storage-service     	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	unit-service        	False  	Helm upgrade failed: another operation (install/upgrade/rollback) is in progress	        	False
osdu-azure  	wks-service         	True   	Release reconciliation succeeded                                                	0.11.0  	False
osdu-azure  	workflow-service    	True   	Release reconciliation succeeded                                                	0.11.0  	False
```

This can be easily resolved by running the following commands on the services that failed.

```bash
flux delete helmrelease <service_name> -n osdu-azure
flux delete helmrelease <service_name> -n osdu-azure
flux reconcile kustomization osdu-stamp
```
