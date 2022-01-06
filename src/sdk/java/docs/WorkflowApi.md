# WorkflowApi

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

Delete a workflow by it&#39;s name.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
String workflowName = "workflowName_example"; // String | Unique Name of the Workflow to be deleted.
try {
    apiInstance.deleteWorkflow(workflowName);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#deleteWorkflow");
    e.printStackTrace();
}
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
> Workflow deployWorkflow(body)

Creates workflow definition with standard orchestrator operators.

API to create a new workflow using standard operators of orchestrator.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
Workflow body = new Workflow(); // Workflow | Request payload for deploying new workflow.
try {
    Workflow result = apiInstance.deployWorkflow(body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#deployWorkflow");
    e.printStackTrace();
}
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
> List&lt;WorkflowRun&gt; getAllWorkflowRuns(workflowName, prefix, startDate, endDate, limit, cursor, partial, conf)

Get all run instances of a workflow.

Get all run instances for a worflow.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
String workflowName = "workflowName_example"; // String | Unique Name of the Workflow for which the execution details has to be fetched.
String prefix = "prefix_example"; // String | A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \"backfill\"
String startDate = "startDate_example"; // String | The start date where this call should start creating workflow runs from (inclusive)
Boolean endDate = true; // Boolean | The end date where this call should stop creating workflow runs at (inclusive)
Integer limit = 56; // Integer | The maximum number of workflow runs to create in a single request. Maximum is 500.
String cursor = "cursor_example"; // String | Cursor for subsequent request.
Boolean partial = true; // Boolean | Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created.
String conf = "conf_example"; // String | JSON configuration added to the Workflow run conf attribute
try {
    List<WorkflowRun> result = apiInstance.getAllWorkflowRuns(workflowName, prefix, startDate, endDate, limit, cursor, partial, conf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#getAllWorkflowRuns");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **String**| Unique Name of the Workflow for which the execution details has to be fetched. |
 **prefix** | **String**| A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \&quot;backfill\&quot; | [optional]
 **startDate** | **String**| The start date where this call should start creating workflow runs from (inclusive) | [optional]
 **endDate** | **Boolean**| The end date where this call should stop creating workflow runs at (inclusive) | [optional]
 **limit** | **Integer**| The maximum number of workflow runs to create in a single request. Maximum is 500. | [optional]
 **cursor** | **String**| Cursor for subsequent request. | [optional]
 **partial** | **Boolean**| Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created. | [optional]
 **conf** | **String**| JSON configuration added to the Workflow run conf attribute | [optional]

### Return type

[**List&lt;WorkflowRun&gt;**](WorkflowRun.md)

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
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
String workflowName = "workflowName_example"; // String | Unique Name of Workflow.
String runId = "runId_example"; // String | Run id for the worfkow.
try {
    WorkflowRun result = apiInstance.getWorkflowRun(workflowName, runId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#getWorkflowRun");
    e.printStackTrace();
}
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
> List&lt;Workflow&gt; listAllWorkflow(prefix)

List all the workflow applicable for a tenant.

List all the workflows for the tenant.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
String prefix = "prefix_example"; // String | Filter workflow names which start with  the full prefix specified.
try {
    List<Workflow> result = apiInstance.listAllWorkflow(prefix);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#listAllWorkflow");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **String**| Filter workflow names which start with  the full prefix specified. | [optional]

### Return type

[**List&lt;Workflow&gt;**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="triggerWorkflow"></a>
# **triggerWorkflow**
> WorkflowRun triggerWorkflow(workflowName, body)

Trigger a workflow.

Trigger a workflow mentioned in payload.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
String workflowName = "workflowName_example"; // String | Unique Name of the Workflow to run.
WorkflowTriggerRequest body = new WorkflowTriggerRequest(); // WorkflowTriggerRequest | 
try {
    WorkflowRun result = apiInstance.triggerWorkflow(workflowName, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#triggerWorkflow");
    e.printStackTrace();
}
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
> Workflow updateWorkflowRun(workflowName, runId, body)

Update the workflow run instance.

Update workflow run.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
String workflowName = "workflowName_example"; // String | Unique Name of Workflow.
String runId = "runId_example"; // String | Run id for the worfkow.
WorkflowRun body = new WorkflowRun(); // WorkflowRun | 
try {
    Workflow result = apiInstance.updateWorkflowRun(workflowName, runId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#updateWorkflowRun");
    e.printStackTrace();
}
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
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.WorkflowApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

WorkflowApi apiInstance = new WorkflowApi();
String workflowName = "workflowName_example"; // String | Name of the Workflow.
try {
    Workflow result = apiInstance.viewWorkflow(workflowName);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling WorkflowApi#viewWorkflow");
    e.printStackTrace();
}
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

