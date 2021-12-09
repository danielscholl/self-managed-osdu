# IO.Swagger.Api.PartitionApi

All URIs are relative to *https://oak-osdu-dplbhggc-mwt3-gw.westeurope.cloudapp.azure.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**CreateUsingPOST**](PartitionApi.md#createusingpost) | **POST** /partition/v1/partitions/{partitionId} | Create Partition
[**DeleteUsingDELETE**](PartitionApi.md#deleteusingdelete) | **DELETE** /partition/v1/partitions/{partitionId} | Delete Partition
[**GetUsingGET**](PartitionApi.md#getusingget) | **GET** /partition/v1/partitions/{partitionId} | Get Single Partition
[**ListUsingGET**](PartitionApi.md#listusingget) | **GET** /partition/v1/partitions | List Partitions
[**UpdateUsingPATCH**](PartitionApi.md#updateusingpatch) | **PATCH** /partition/v1/partitions/{partitionId} | Update Partition


<a name="createusingpost"></a>
# **CreateUsingPOST**
> void CreateUsingPOST (string partitionId, PartitionDto partitionInfo)

Create Partition

By passing in a partition Id and a partition info object you can create a partition. 

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class CreateUsingPOSTExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new PartitionApi();
            var partitionId = partitionId_example;  // string | partitionId
            var partitionInfo = new PartitionDto(); // PartitionDto | partitionInfo

            try
            {
                // Create Partition
                apiInstance.CreateUsingPOST(partitionId, partitionInfo);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling PartitionApi.CreateUsingPOST: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **string**| partitionId | 
 **partitionInfo** | [**PartitionDto**](PartitionDto.md)| partitionInfo | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deleteusingdelete"></a>
# **DeleteUsingDELETE**
> void DeleteUsingDELETE (string partitionId)

Delete Partition

By passing in a single partition Id, you can delete a partition. 

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class DeleteUsingDELETEExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new PartitionApi();
            var partitionId = partitionId_example;  // string | partitionId

            try
            {
                // Delete Partition
                apiInstance.DeleteUsingDELETE(partitionId);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling PartitionApi.DeleteUsingDELETE: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **string**| partitionId | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getusingget"></a>
# **GetUsingGET**
> Dictionary<string, PartitionProperty> GetUsingGET (string partitionId)

Get Single Partition

By passing in a partition Id, you can retrieve the partition information. 

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class GetUsingGETExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new PartitionApi();
            var partitionId = partitionId_example;  // string | partitionId

            try
            {
                // Get Single Partition
                Dictionary&lt;string, PartitionProperty&gt; result = apiInstance.GetUsingGET(partitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling PartitionApi.GetUsingGET: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **string**| partitionId | 

### Return type

[**Dictionary<string, PartitionProperty>**](PartitionProperty.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="listusingget"></a>
# **ListUsingGET**
> List<string> ListUsingGET ()

List Partitions

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class ListUsingGETExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new PartitionApi();

            try
            {
                // List Partitions
                List&lt;string&gt; result = apiInstance.ListUsingGET();
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling PartitionApi.ListUsingGET: " + e.Message );
            }
        }
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**List<string>**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="updateusingpatch"></a>
# **UpdateUsingPATCH**
> void UpdateUsingPATCH (string partitionId, PartitionDto partitionInfo)

Update Partition

By passing in a partition Id and a partition info object you can update a partition. 

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class UpdateUsingPATCHExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new PartitionApi();
            var partitionId = partitionId_example;  // string | partitionId
            var partitionInfo = new PartitionDto(); // PartitionDto | partitionInfo

            try
            {
                // Update Partition
                apiInstance.UpdateUsingPATCH(partitionId, partitionInfo);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling PartitionApi.UpdateUsingPATCH: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **string**| partitionId | 
 **partitionInfo** | [**PartitionDto**](PartitionDto.md)| partitionInfo | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

