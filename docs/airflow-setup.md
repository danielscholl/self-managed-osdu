# Airflow User Setup

```bash
# Get Airflow web container
AIRFLOW_WEB_CONTAINER=$(kubectl get pod -n airflow | grep "web" | cut -f 1 -d " ")

# Login to airflow web container.
kubectl exec --stdin --tty $AIRFLOW_WEB_CONTAINER -n airflow -- /bin/bash

# Add a User
USER_FIRST=admin
USER_LAST=admin
EMAIL=admin@email.com

airflow create_user \
  --role Admin \
  --username $USER_FIRST \
  --firstname $USER_FIRST \
  --lastname $USER_LAST \
  --email $EMAIL \
  --password <your_password>

```
