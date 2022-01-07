# OsduClient.Api.NotificationApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**RecordChangedUsingPOST**](NotificationApi.md#recordchangedusingpost) | **POST** /api/notification/v1/push-handlers/records-changed | Notifies subscribers that records have changed


<a name="recordchangedusingpost"></a>
# **RecordChangedUsingPOST**
> NotificationResponseEntity RecordChangedUsingPOST (string dataPartitionId)

Notifies subscribers that records have changed

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class RecordChangedUsingPOSTExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new NotificationApi();
            var dataPartitionId = dataPartitionId_example;  // string | tenant

            try
            {
                // Notifies subscribers that records have changed
                NotificationResponseEntity result = apiInstance.RecordChangedUsingPOST(dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling NotificationApi.RecordChangedUsingPOST: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| tenant | 

### Return type

[**NotificationResponseEntity**](NotificationResponseEntity.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

