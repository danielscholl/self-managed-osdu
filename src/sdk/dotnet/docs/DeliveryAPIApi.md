# OsduClient.Api.DeliveryAPIApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ReturnsDeliveryInstructionsForFileSUsingSRNs**](DeliveryAPIApi.md#returnsdeliveryinstructionsforfilesusingsrns) | **POST** /api/file/v2/delivery/getFileSignedUrl | 


<a name="returnsdeliveryinstructionsforfilesusingsrns"></a>
# **ReturnsDeliveryInstructionsForFileSUsingSRNs**
> FileDeliveryGetFileSignedURLResponse ReturnsDeliveryInstructionsForFileSUsingSRNs (string dataPartitionId, FileDeliveryGetFileSignedURLRequest body = null)



Returns delivery instructions for File(s) using SRNs

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class ReturnsDeliveryInstructionsForFileSUsingSRNsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new DeliveryAPIApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var body = new FileDeliveryGetFileSignedURLRequest(); // FileDeliveryGetFileSignedURLRequest |  (optional) 

            try
            {
                FileDeliveryGetFileSignedURLResponse result = apiInstance.ReturnsDeliveryInstructionsForFileSUsingSRNs(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DeliveryAPIApi.ReturnsDeliveryInstructionsForFileSUsingSRNs: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileDeliveryGetFileSignedURLRequest**](FileDeliveryGetFileSignedURLRequest.md)|  | [optional] 

### Return type

[**FileDeliveryGetFileSignedURLResponse**](FileDeliveryGetFileSignedURLResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

