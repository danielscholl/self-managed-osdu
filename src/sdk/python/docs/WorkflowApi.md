# OsduClient.WorkflowApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_workflow**](WorkflowApi.md#delete_workflow) | **DELETE** /api/workflow/v1/workflow/{workflow_name} | Delete a workflow defintion.
[**deploy_workflow**](WorkflowApi.md#deploy_workflow) | **POST** /api/workflow/v1/workflow | Creates workflow definition with standard orchestrator operators.
[**get_all_workflow_runs**](WorkflowApi.md#get_all_workflow_runs) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Get all run instances of a workflow.
[**get_workflow_run**](WorkflowApi.md#get_workflow_run) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Get details for a speciffic workflow run instance.
[**list_all_workflow**](WorkflowApi.md#list_all_workflow) | **GET** /api/workflow/v1/workflow | List all the workflow applicable for a tenant.
[**trigger_workflow**](WorkflowApi.md#trigger_workflow) | **POST** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Trigger a workflow.
[**update_workflow_run**](WorkflowApi.md#update_workflow_run) | **PUT** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Update the workflow run instance.
[**view_workflow**](WorkflowApi.md#view_workflow) | **GET** /api/workflow/v1/workflow/{workflow_name} | Get complete details for a workflow.


# **delete_workflow**
> delete_workflow(workflow_name)

Delete a workflow defintion.

Delete a workflow by it's name.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
workflow_name = 'workflow_name_example' # str | Unique Name of the Workflow to be deleted.

try:
    # Delete a workflow defintion.
    api_instance.delete_workflow(workflow_name)
except ApiException as e:
    print("Exception when calling WorkflowApi->delete_workflow: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflow_name** | **str**| Unique Name of the Workflow to be deleted. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deploy_workflow**
> Workflow deploy_workflow(body=body)

Creates workflow definition with standard orchestrator operators.

API to create a new workflow using standard operators of orchestrator.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
body = OsduClient.Workflow() # Workflow | Request payload for deploying new workflow. (optional)

try:
    # Creates workflow definition with standard orchestrator operators.
    api_response = api_instance.deploy_workflow(body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling WorkflowApi->deploy_workflow: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Workflow**](Workflow.md)| Request payload for deploying new workflow. | [optional] 

### Return type

[**Workflow**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_all_workflow_runs**
> list[WorkflowRun] get_all_workflow_runs(workflow_name, prefix=prefix, start_date=start_date, end_date=end_date, limit=limit, cursor=cursor, partial=partial, conf=conf)

Get all run instances of a workflow.

Get all run instances for a worflow.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
workflow_name = 'workflow_name_example' # str | Unique Name of the Workflow for which the execution details has to be fetched.
prefix = 'prefix_example' # str | A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \"backfill\" (optional)
start_date = 'start_date_example' # str | The start date where this call should start creating workflow runs from (inclusive) (optional)
end_date = true # bool | The end date where this call should stop creating workflow runs at (inclusive) (optional)
limit = 56 # int | The maximum number of workflow runs to create in a single request. Maximum is 500. (optional)
cursor = 'cursor_example' # str | Cursor for subsequent request. (optional)
partial = true # bool | Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created. (optional)
conf = 'conf_example' # str | JSON configuration added to the Workflow run conf attribute (optional)

try:
    # Get all run instances of a workflow.
    api_response = api_instance.get_all_workflow_runs(workflow_name, prefix=prefix, start_date=start_date, end_date=end_date, limit=limit, cursor=cursor, partial=partial, conf=conf)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling WorkflowApi->get_all_workflow_runs: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflow_name** | **str**| Unique Name of the Workflow for which the execution details has to be fetched. | 
 **prefix** | **str**| A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \&quot;backfill\&quot; | [optional] 
 **start_date** | **str**| The start date where this call should start creating workflow runs from (inclusive) | [optional] 
 **end_date** | **bool**| The end date where this call should stop creating workflow runs at (inclusive) | [optional] 
 **limit** | **int**| The maximum number of workflow runs to create in a single request. Maximum is 500. | [optional] 
 **cursor** | **str**| Cursor for subsequent request. | [optional] 
 **partial** | **bool**| Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created. | [optional] 
 **conf** | **str**| JSON configuration added to the Workflow run conf attribute | [optional] 

### Return type

[**list[WorkflowRun]**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_workflow_run**
> WorkflowRun get_workflow_run(workflow_name, run_id)

Get details for a speciffic workflow run instance.

Get an execution instances for a workflow.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
workflow_name = 'workflow_name_example' # str | Unique Name of Workflow.
run_id = 'run_id_example' # str | Run id for the worfkow.

try:
    # Get details for a speciffic workflow run instance.
    api_response = api_instance.get_workflow_run(workflow_name, run_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling WorkflowApi->get_workflow_run: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflow_name** | **str**| Unique Name of Workflow. | 
 **run_id** | **str**| Run id for the worfkow. | 

### Return type

[**WorkflowRun**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_all_workflow**
> list[Workflow] list_all_workflow(prefix=prefix)

List all the workflow applicable for a tenant.

List all the workflows for the tenant.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
prefix = 'prefix_example' # str | Filter workflow names which start with  the full prefix specified. (optional)

try:
    # List all the workflow applicable for a tenant.
    api_response = api_instance.list_all_workflow(prefix=prefix)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling WorkflowApi->list_all_workflow: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **str**| Filter workflow names which start with  the full prefix specified. | [optional] 

### Return type

[**list[Workflow]**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **trigger_workflow**
> WorkflowRun trigger_workflow(workflow_name, body=body)

Trigger a workflow.

Trigger a workflow mentioned in payload.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
workflow_name = 'workflow_name_example' # str | Unique Name of the Workflow to run.
body = OsduClient.WorkflowTriggerRequest() # WorkflowTriggerRequest |  (optional)

try:
    # Trigger a workflow.
    api_response = api_instance.trigger_workflow(workflow_name, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling WorkflowApi->trigger_workflow: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflow_name** | **str**| Unique Name of the Workflow to run. | 
 **body** | [**WorkflowTriggerRequest**](WorkflowTriggerRequest.md)|  | [optional] 

### Return type

[**WorkflowRun**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_workflow_run**
> Workflow update_workflow_run(workflow_name, run_id, body=body)

Update the workflow run instance.

Update workflow run.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
workflow_name = 'workflow_name_example' # str | Unique Name of Workflow.
run_id = 'run_id_example' # str | Run id for the worfkow.
body = OsduClient.WorkflowRun() # WorkflowRun |  (optional)

try:
    # Update the workflow run instance.
    api_response = api_instance.update_workflow_run(workflow_name, run_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling WorkflowApi->update_workflow_run: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflow_name** | **str**| Unique Name of Workflow. | 
 **run_id** | **str**| Run id for the worfkow. | 
 **body** | [**WorkflowRun**](WorkflowRun.md)|  | [optional] 

### Return type

[**Workflow**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **view_workflow**
> Workflow view_workflow(workflow_name)

Get complete details for a workflow.

Get complete details for an workflow.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.WorkflowApi(OsduClient.ApiClient(configuration))
workflow_name = 'workflow_name_example' # str | Name of the Workflow.

try:
    # Get complete details for a workflow.
    api_response = api_instance.view_workflow(workflow_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling WorkflowApi->view_workflow: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflow_name** | **str**| Name of the Workflow. | 

### Return type

[**Workflow**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

