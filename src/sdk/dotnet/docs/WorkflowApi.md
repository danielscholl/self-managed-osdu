# IO.Swagger.Api.WorkflowApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteWorkflow**](WorkflowApi.md#deleteworkflow) | **DELETE** /api/workflow/v1/workflow/{workflow_name} | Delete a workflow defintion.
[**DeployWorkflow**](WorkflowApi.md#deployworkflow) | **POST** /api/workflow/v1/workflow | Creates workflow definition with standard orchestrator operators.
[**GetAllWorkflowRuns**](WorkflowApi.md#getallworkflowruns) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Get all run instances of a workflow.
[**GetWorkflowRun**](WorkflowApi.md#getworkflowrun) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Get details for a speciffic workflow run instance.
[**ListAllWorkflow**](WorkflowApi.md#listallworkflow) | **GET** /api/workflow/v1/workflow | List all the workflow applicable for a tenant.
[**TriggerWorkflow**](WorkflowApi.md#triggerworkflow) | **POST** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Trigger a workflow.
[**UpdateWorkflowRun**](WorkflowApi.md#updateworkflowrun) | **PUT** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Update the workflow run instance.
[**ViewWorkflow**](WorkflowApi.md#viewworkflow) | **GET** /api/workflow/v1/workflow/{workflow_name} | Get complete details for a workflow.


<a name="deleteworkflow"></a>
# **DeleteWorkflow**
> void DeleteWorkflow (string workflowName)

Delete a workflow defintion.

Delete a workflow by it's name.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class DeleteWorkflowExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var workflowName = workflowName_example;  // string | Unique Name of the Workflow to be deleted.

            try
            {
                // Delete a workflow defintion.
                apiInstance.DeleteWorkflow(workflowName);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.DeleteWorkflow: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **string**| Unique Name of the Workflow to be deleted. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deployworkflow"></a>
# **DeployWorkflow**
> Workflow DeployWorkflow (Workflow body = null)

Creates workflow definition with standard orchestrator operators.

API to create a new workflow using standard operators of orchestrator.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class DeployWorkflowExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var body = new Workflow(); // Workflow | Request payload for deploying new workflow. (optional) 

            try
            {
                // Creates workflow definition with standard orchestrator operators.
                Workflow result = apiInstance.DeployWorkflow(body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.DeployWorkflow: " + e.Message );
            }
        }
    }
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

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getallworkflowruns"></a>
# **GetAllWorkflowRuns**
> List<WorkflowRun> GetAllWorkflowRuns (string workflowName, string prefix = null, string startDate = null, bool? endDate = null, int? limit = null, string cursor = null, bool? partial = null, string conf = null)

Get all run instances of a workflow.

Get all run instances for a worflow.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class GetAllWorkflowRunsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var workflowName = workflowName_example;  // string | Unique Name of the Workflow for which the execution details has to be fetched.
            var prefix = prefix_example;  // string | A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \"backfill\" (optional) 
            var startDate = startDate_example;  // string | The start date where this call should start creating workflow runs from (inclusive) (optional) 
            var endDate = true;  // bool? | The end date where this call should stop creating workflow runs at (inclusive) (optional) 
            var limit = 56;  // int? | The maximum number of workflow runs to create in a single request. Maximum is 500. (optional) 
            var cursor = cursor_example;  // string | Cursor for subsequent request. (optional) 
            var partial = true;  // bool? | Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created. (optional) 
            var conf = conf_example;  // string | JSON configuration added to the Workflow run conf attribute (optional) 

            try
            {
                // Get all run instances of a workflow.
                List&lt;WorkflowRun&gt; result = apiInstance.GetAllWorkflowRuns(workflowName, prefix, startDate, endDate, limit, cursor, partial, conf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.GetAllWorkflowRuns: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **string**| Unique Name of the Workflow for which the execution details has to be fetched. | 
 **prefix** | **string**| A prefix used when generating the runId of the workflow run. Prefix cannot contain the word \&quot;backfill\&quot; | [optional] 
 **startDate** | **string**| The start date where this call should start creating workflow runs from (inclusive) | [optional] 
 **endDate** | **bool?**| The end date where this call should stop creating workflow runs at (inclusive) | [optional] 
 **limit** | **int?**| The maximum number of workflow runs to create in a single request. Maximum is 500. | [optional] 
 **cursor** | **string**| Cursor for subsequent request. | [optional] 
 **partial** | **bool?**| Whether or not a partial batch can be created. If true, and the number of workflow runs that would be created between the start and end exceeds the limit, no workflow runs will be created. | [optional] 
 **conf** | **string**| JSON configuration added to the Workflow run conf attribute | [optional] 

### Return type

[**List<WorkflowRun>**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getworkflowrun"></a>
# **GetWorkflowRun**
> WorkflowRun GetWorkflowRun (string workflowName, string runId)

Get details for a speciffic workflow run instance.

Get an execution instances for a workflow.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class GetWorkflowRunExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var workflowName = workflowName_example;  // string | Unique Name of Workflow.
            var runId = runId_example;  // string | Run id for the worfkow.

            try
            {
                // Get details for a speciffic workflow run instance.
                WorkflowRun result = apiInstance.GetWorkflowRun(workflowName, runId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.GetWorkflowRun: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **string**| Unique Name of Workflow. | 
 **runId** | **string**| Run id for the worfkow. | 

### Return type

[**WorkflowRun**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="listallworkflow"></a>
# **ListAllWorkflow**
> List<Workflow> ListAllWorkflow (string prefix = null)

List all the workflow applicable for a tenant.

List all the workflows for the tenant.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class ListAllWorkflowExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var prefix = prefix_example;  // string | Filter workflow names which start with  the full prefix specified. (optional) 

            try
            {
                // List all the workflow applicable for a tenant.
                List&lt;Workflow&gt; result = apiInstance.ListAllWorkflow(prefix);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.ListAllWorkflow: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **string**| Filter workflow names which start with  the full prefix specified. | [optional] 

### Return type

[**List<Workflow>**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="triggerworkflow"></a>
# **TriggerWorkflow**
> WorkflowRun TriggerWorkflow (string workflowName, WorkflowTriggerRequest body = null)

Trigger a workflow.

Trigger a workflow mentioned in payload.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class TriggerWorkflowExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var workflowName = workflowName_example;  // string | Unique Name of the Workflow to run.
            var body = new WorkflowTriggerRequest(); // WorkflowTriggerRequest |  (optional) 

            try
            {
                // Trigger a workflow.
                WorkflowRun result = apiInstance.TriggerWorkflow(workflowName, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.TriggerWorkflow: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **string**| Unique Name of the Workflow to run. | 
 **body** | [**WorkflowTriggerRequest**](WorkflowTriggerRequest.md)|  | [optional] 

### Return type

[**WorkflowRun**](WorkflowRun.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="updateworkflowrun"></a>
# **UpdateWorkflowRun**
> Workflow UpdateWorkflowRun (string workflowName, string runId, WorkflowRun body = null)

Update the workflow run instance.

Update workflow run.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class UpdateWorkflowRunExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var workflowName = workflowName_example;  // string | Unique Name of Workflow.
            var runId = runId_example;  // string | Run id for the worfkow.
            var body = new WorkflowRun(); // WorkflowRun |  (optional) 

            try
            {
                // Update the workflow run instance.
                Workflow result = apiInstance.UpdateWorkflowRun(workflowName, runId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.UpdateWorkflowRun: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **string**| Unique Name of Workflow. | 
 **runId** | **string**| Run id for the worfkow. | 
 **body** | [**WorkflowRun**](WorkflowRun.md)|  | [optional] 

### Return type

[**Workflow**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="viewworkflow"></a>
# **ViewWorkflow**
> Workflow ViewWorkflow (string workflowName)

Get complete details for a workflow.

Get complete details for an workflow.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class ViewWorkflowExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new WorkflowApi();
            var workflowName = workflowName_example;  // string | Name of the Workflow.

            try
            {
                // Get complete details for a workflow.
                Workflow result = apiInstance.ViewWorkflow(workflowName);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling WorkflowApi.ViewWorkflow: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowName** | **string**| Name of the Workflow. | 

### Return type

[**Workflow**](Workflow.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

