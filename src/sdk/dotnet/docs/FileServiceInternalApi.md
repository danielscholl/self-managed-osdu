# IO.Swagger.Api.FileServiceInternalApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_**](FileServiceInternalApi.md#allowstheapplicationtoaudittheattemptedfileuploadsthemethodisinternalandisnotavailableforthirdpartyapplications_) | **POST** /api/file/v2/getFileList | 
[**ReturnsFileLocationAndDriver_**](FileServiceInternalApi.md#returnsfilelocationanddriver_) | **POST** /api/file/v2/getFileLocation | 


<a name="allowstheapplicationtoaudittheattemptedfileuploadsthemethodisinternalandisnotavailableforthirdpartyapplications_"></a>
# **AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_**
> FileListResponse AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_ (string dataPartitionId, FileListRequest body = null)



Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_Example
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceInternalApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var body = new FileListRequest(); // FileListRequest |  (optional) 

            try
            {
                FileListResponse result = apiInstance.AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceInternalApi.AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileListRequest**](FileListRequest.md)|  | [optional] 

### Return type

[**FileListResponse**](FileListResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="returnsfilelocationanddriver_"></a>
# **ReturnsFileLocationAndDriver_**
> FileLocationResponse ReturnsFileLocationAndDriver_ (string dataPartitionId, FileLocationRequest body = null)



Returns file `Location` and `Driver`.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class ReturnsFileLocationAndDriver_Example
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceInternalApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var body = new FileLocationRequest(); // FileLocationRequest |  (optional) 

            try
            {
                FileLocationResponse result = apiInstance.ReturnsFileLocationAndDriver_(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceInternalApi.ReturnsFileLocationAndDriver_: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileLocationRequest**](FileLocationRequest.md)|  | [optional] 

### Return type

[**FileLocationResponse**](FileLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

