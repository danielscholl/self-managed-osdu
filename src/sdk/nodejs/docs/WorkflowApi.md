# SelfManagedOsdu.WorkflowApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteWorkflow**](WorkflowApi.md#deleteWorkflow) | **DELETE** /api/workflow/v1/workflow/{workflow_name} | Delete a workflow defintion.
[**deployWorkflow**](WorkflowApi.md#deployWorkflow) | **POST** /api/workflow/v1/workflow | Creates workflow definition with standard orchestrator operators.
[**getAllWorkflowRuns**](WorkflowApi.md#getAllWorkflowRuns) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Get all run instances of a workflow.
[**getWorkflowRun**](WorkflowApi.md#getWorkflowRun) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Get details for a speciffic workflow run instance.
[**listAllWorkflow**](WorkflowApi.md#listAllWorkflow) | **GET** /api/workflow/v1/workflow | List all the workflow applicable for a tenant.
[**triggerWorkflow**](WorkflowApi.md#triggerWorkflow) | **POST** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Trigger a workflow.
[**updateWorkflowRun**](WorkflowApi.md#updateWorkflowRun) | **PUT** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Update the workflow run instance.
[**viewWorkflow**](WorkflowApi.md#viewWorkflow) | **GET** /api/workflow/v1/workflow/{workflow_name} | Get complete details for a workflow.


<a name="deleteWorkflow"></a>
# **deleteWorkflow**
> deleteWorkflow(workflowName)

Delete a workflow defintion.

Delete a workflow by it's name.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var workflowName = "workflowName_example"; // String | Unique Name of the Workflow to be deleted.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteWorkflow(workflowName, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **String**| Unique Name of the Workflow to be deleted. | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deployWorkflow"></a>
# **deployWorkflow**
> Workflow deployWorkflow(opts)

Creates workflow definition with standard orchestrator operators.

API to create a new workflow using standard operators of orchestrator.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var opts = { 
  'body': new SelfManagedOsdu.Workflow() // Workflow | Request payload for deploying new workflow.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.deployWorkflow(opts, callback);
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

<a name="getAllWorkflowRuns"></a>
# **getAllWorkflowRuns**
> [WorkflowRun] getAllWorkflowRuns(workflowName, opts)

Get all run instances of a workflow.

Get all run instances for a worflow.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var workflowName = "workflowName_example"; // String | Unique Name of the Workflow for which the execution details has to be fetched.

var opts = { 
  'prefix': "prefix_example", // String | A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \"backfill\"
  'startDate': "startDate_example", // String | The start date where this call should start creating workflow runs from (inclusive)
  'endDate': true, // Boolean | The end date where this call should stop creating workflow runs at (inclusive)
  'limit': 56, // Number | The maximum number of workflow runs to create in a single request. Maximum is 500.
  'cursor': "cursor_example", // String | Cursor for subsequent request.
  'partial': true, // Boolean | Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created.
  'conf': "conf_example" // String | JSON configuration added to the Workflow run conf attribute
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getAllWorkflowRuns(workflowName, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **String**| Unique Name of the Workflow for which the execution details has to be fetched. | 
 **prefix** | **String**| A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \"backfill\" | [optional] 
 **startDate** | **String**| The start date where this call should start creating workflow runs from (inclusive) | [optional] 
 **endDate** | **Boolean**| The end date where this call should stop creating workflow runs at (inclusive) | [optional] 
 **limit** | **Number**| The maximum number of workflow runs to create in a single request. Maximum is 500. | [optional] 
 **cursor** | **String**| Cursor for subsequent request. | [optional] 
 **partial** | **Boolean**| Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created. | [optional] 
 **conf** | **String**| JSON configuration added to the Workflow run conf attribute | [optional] 

### Return type

[**[WorkflowRun]**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getWorkflowRun"></a>
# **getWorkflowRun**
> WorkflowRun getWorkflowRun(workflowName, runId)

Get details for a speciffic workflow run instance.

Get an execution instances for a workflow.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var workflowName = "workflowName_example"; // String | Unique Name of Workflow.

var runId = "runId_example"; // String | Run id for the worfkow.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getWorkflowRun(workflowName, runId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **String**| Unique Name of Workflow. | 
 **runId** | **String**| Run id for the worfkow. | 

### Return type

[**WorkflowRun**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="listAllWorkflow"></a>
# **listAllWorkflow**
> [Workflow] listAllWorkflow(opts)

List all the workflow applicable for a tenant.

List all the workflows for the tenant.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var opts = { 
  'prefix': "prefix_example" // String | Filter workflow names which start with  the full prefix specified.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.listAllWorkflow(opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **String**| Filter workflow names which start with  the full prefix specified. | [optional] 

### Return type

[**[Workflow]**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="triggerWorkflow"></a>
# **triggerWorkflow**
> WorkflowRun triggerWorkflow(workflowName, opts)

Trigger a workflow.

Trigger a workflow mentioned in payload.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var workflowName = "workflowName_example"; // String | Unique Name of the Workflow to run.

var opts = { 
  'body': new SelfManagedOsdu.WorkflowTriggerRequest() // WorkflowTriggerRequest | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.triggerWorkflow(workflowName, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **String**| Unique Name of the Workflow to run. | 
 **body** | [**WorkflowTriggerRequest**](WorkflowTriggerRequest.md)|  | [optional] 

### Return type

[**WorkflowRun**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="updateWorkflowRun"></a>
# **updateWorkflowRun**
> Workflow updateWorkflowRun(workflowName, runId, opts)

Update the workflow run instance.

Update workflow run.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var workflowName = "workflowName_example"; // String | Unique Name of Workflow.

var runId = "runId_example"; // String | Run id for the worfkow.

var opts = { 
  'body': new SelfManagedOsdu.WorkflowRun() // WorkflowRun | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.updateWorkflowRun(workflowName, runId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **String**| Unique Name of Workflow. | 
 **runId** | **String**| Run id for the worfkow. | 
 **body** | [**WorkflowRun**](WorkflowRun.md)|  | [optional] 

### Return type

[**Workflow**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="viewWorkflow"></a>
# **viewWorkflow**
> Workflow viewWorkflow(workflowName)

Get complete details for a workflow.

Get complete details for an workflow.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.WorkflowApi();

var workflowName = "workflowName_example"; // String | Name of the Workflow.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.viewWorkflow(workflowName, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **String**| Name of the Workflow. | 

### Return type

[**Workflow**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

