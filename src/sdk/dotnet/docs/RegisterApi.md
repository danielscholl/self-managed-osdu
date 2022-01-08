# OsduClient.Api.RegisterApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**CreateADDMSRegistration**](RegisterApi.md#createaddmsregistration) | **POST** /api/register/v1/ddms | Create a DDMS registration
[**CreateASubscription**](RegisterApi.md#createasubscription) | **POST** /api/register/v1/subscription | Create a subscription
[**CreateAnActionRegistration**](RegisterApi.md#createanactionregistration) | **POST** /api/register/v1/action | Create an action registration
[**DeleteADDMSRegistration**](RegisterApi.md#deleteaddmsregistration) | **DELETE** /api/register/v1/ddms/{id} | Delete a DDMS registration
[**DeleteASubscriptionById**](RegisterApi.md#deleteasubscriptionbyid) | **DELETE** /api/register/v1/subscription/{id} | Delete a subscription
[**DeleteAnActionRegistration**](RegisterApi.md#deleteanactionregistration) | **DELETE** /api/register/v1/action/{id} | Delete an action  registration
[**GetADDMSRegistration**](RegisterApi.md#getaddmsregistration) | **GET** /api/register/v1/ddms/{id} | Get a DDMS registration
[**GetASubscriptionById**](RegisterApi.md#getasubscriptionbyid) | **GET** /api/register/v1/subscription/{id} | Get a subscription
[**GetAnActionRegistration**](RegisterApi.md#getanactionregistration) | **GET** /api/register/v1/action/{id} | Get an action registration
[**ListAllTopics**](RegisterApi.md#listalltopics) | **GET** /api/register/v1/topics | List all topics
[**QueryADDMSRegistration**](RegisterApi.md#queryaddmsregistration) | **GET** /api/register/v1/ddms | Query for DDMS registrations
[**RetrieveAnActionRegistration**](RegisterApi.md#retrieveanactionregistration) | **POST** /api/register/v1/action:retrieve | Query for action registrations and substitutes any action with the given parameters
[**TestAnActionRegistration**](RegisterApi.md#testanactionregistration) | **POST** /api/register/v1/action:test | Test an action registration
[**UpdateSecretForSubscription**](RegisterApi.md#updatesecretforsubscription) | **PUT** /api/register/v1/subscription/{id}/secret | Update secret for subscription


<a name="createaddmsregistration"></a>
# **CreateADDMSRegistration**
> RegisterDdms CreateADDMSRegistration (string dataPartitionId, RegisterDdms body = null)

Create a DDMS registration

Create a DDMS registration using an OpenApi spec V3 document. Required roles: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class CreateADDMSRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.
            var body = new RegisterDdms(); // RegisterDdms |  (optional) 

            try
            {
                // Create a DDMS registration
                RegisterDdms result = apiInstance.CreateADDMSRegistration(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.CreateADDMSRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterDdms**](RegisterDdms.md)|  | [optional] 

### Return type

[**RegisterDdms**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="createasubscription"></a>
# **CreateASubscription**
> RegisterSubscriptionCreateResult CreateASubscription (string dataPartitionId, RegisterSubscription body = null)

Create a subscription

Create a subscription. Required roles: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class CreateASubscriptionExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.
            var body = new RegisterSubscription(); // RegisterSubscription |  (optional) 

            try
            {
                // Create a subscription
                RegisterSubscriptionCreateResult result = apiInstance.CreateASubscription(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.CreateASubscription: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterSubscription**](RegisterSubscription.md)|  | [optional] 

### Return type

[**RegisterSubscriptionCreateResult**](RegisterSubscriptionCreateResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="createanactionregistration"></a>
# **CreateAnActionRegistration**
> RegisterAction CreateAnActionRegistration (string dataPartitionId, RegisterCreateAction body = null)

Create an action registration

Create an action registration. Required role: 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class CreateAnActionRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.
            var body = new RegisterCreateAction(); // RegisterCreateAction |  (optional) 

            try
            {
                // Create an action registration
                RegisterAction result = apiInstance.CreateAnActionRegistration(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.CreateAnActionRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterCreateAction**](RegisterCreateAction.md)|  | [optional] 

### Return type

[**RegisterAction**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deleteaddmsregistration"></a>
# **DeleteADDMSRegistration**
> void DeleteADDMSRegistration (string id, string dataPartitionId)

Delete a DDMS registration

Delete a DDMS registration with the given id. Required roles: 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteADDMSRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var id = id_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // Delete a DDMS registration
                apiInstance.DeleteADDMSRegistration(id, dataPartitionId);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.DeleteADDMSRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deleteasubscriptionbyid"></a>
# **DeleteASubscriptionById**
> void DeleteASubscriptionById (string id, string dataPartitionId)

Delete a subscription

Delete a subscription with its Id. Required role: 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteASubscriptionByIdExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var id = id_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // Delete a subscription
                apiInstance.DeleteASubscriptionById(id, dataPartitionId);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.DeleteASubscriptionById: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deleteanactionregistration"></a>
# **DeleteAnActionRegistration**
> void DeleteAnActionRegistration (string id, string dataPartitionId)

Delete an action  registration

Delete an action registration with the given id. Required role: 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteAnActionRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var id = id_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // Delete an action  registration
                apiInstance.DeleteAnActionRegistration(id, dataPartitionId);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.DeleteAnActionRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getaddmsregistration"></a>
# **GetADDMSRegistration**
> RegisterDdms GetADDMSRegistration (string id, string dataPartitionId)

Get a DDMS registration

Get a DDMS registration with the given id. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetADDMSRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var id = id_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // Get a DDMS registration
                RegisterDdms result = apiInstance.GetADDMSRegistration(id, dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.GetADDMSRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterDdms**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getasubscriptionbyid"></a>
# **GetASubscriptionById**
> RegisterGetSubscriptionResult GetASubscriptionById (string id, string dataPartitionId)

Get a subscription

Get a subscription with its Id. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetASubscriptionByIdExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var id = id_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // Get a subscription
                RegisterGetSubscriptionResult result = apiInstance.GetASubscriptionById(id, dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.GetASubscriptionById: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterGetSubscriptionResult**](RegisterGetSubscriptionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getanactionregistration"></a>
# **GetAnActionRegistration**
> RegisterAction GetAnActionRegistration (string id, string dataPartitionId)

Get an action registration

Get an action registration with the given id. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetAnActionRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var id = id_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // Get an action registration
                RegisterAction result = apiInstance.GetAnActionRegistration(id, dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.GetAnActionRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterAction**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="listalltopics"></a>
# **ListAllTopics**
> List<RegisterTopic> ListAllTopics (string dataPartitionId)

List all topics

List all topics that you can create a subscription for, along with the corresponding sample messages. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class ListAllTopicsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // List all topics
                List&lt;RegisterTopic&gt; result = apiInstance.ListAllTopics(dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.ListAllTopics: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**List<RegisterTopic>**](RegisterTopic.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="queryaddmsregistration"></a>
# **QueryADDMSRegistration**
> List<RegisterDdms> QueryADDMSRegistration (string type, string dataPartitionId)

Query for DDMS registrations

Query for DDMS registrations allowing retrievals by type. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class QueryADDMSRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var type = type_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.

            try
            {
                // Query for DDMS registrations
                List&lt;RegisterDdms&gt; result = apiInstance.QueryADDMSRegistration(type, dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.QueryADDMSRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**List<RegisterDdms>**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="retrieveanactionregistration"></a>
# **RetrieveAnActionRegistration**
> List<RegisterAction> RetrieveAnActionRegistration (string dataPartitionId, RegisterRecord body = null)

Query for action registrations and substitutes any action with the given parameters

Retrieve an action registration. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class RetrieveAnActionRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition. (default to opendes)
            var body = new RegisterRecord(); // RegisterRecord | The Record to find matching actions for and apply the template for. (optional) 

            try
            {
                // Query for action registrations and substitutes any action with the given parameters
                List&lt;RegisterAction&gt; result = apiInstance.RetrieveAnActionRegistration(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.RetrieveAnActionRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | [default to opendes]
 **body** | [**RegisterRecord**](RegisterRecord.md)| The Record to find matching actions for and apply the template for. | [optional] 

### Return type

[**List<RegisterAction>**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="testanactionregistration"></a>
# **TestAnActionRegistration**
> RegisterTestActionResult TestAnActionRegistration (string dataPartitionId, RegisterTestAction body = null)

Test an action registration

Test an action registration. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class TestAnActionRegistrationExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.
            var body = new RegisterTestAction(); // RegisterTestAction |  (optional) 

            try
            {
                // Test an action registration
                RegisterTestActionResult result = apiInstance.TestAnActionRegistration(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.TestAnActionRegistration: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterTestAction**](RegisterTestAction.md)|  | [optional] 

### Return type

[**RegisterTestActionResult**](RegisterTestActionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="updatesecretforsubscription"></a>
# **UpdateSecretForSubscription**
> void UpdateSecretForSubscription (string id, string dataPartitionId, RegisterSecret body = null)

Update secret for subscription

Update secret for a subscription. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class UpdateSecretForSubscriptionExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new RegisterApi();
            var id = id_example;  // string | 
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the partition to use. This should be either the partition name associated with the partition.
            var body = new RegisterSecret(); // RegisterSecret |  (optional) 

            try
            {
                // Update secret for subscription
                apiInstance.UpdateSecretForSubscription(id, dataPartitionId, body);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling RegisterApi.UpdateSecretForSubscription: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **dataPartitionId** | **string**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterSecret**](RegisterSecret.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

