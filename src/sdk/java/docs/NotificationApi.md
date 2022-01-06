# NotificationApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**recordChangedUsingPOST**](NotificationApi.md#recordChangedUsingPOST) | **POST** /api/notification/v1/push-handlers/records-changed | Notifies subscribers that records have changed


<a name="recordChangedUsingPOST"></a>
# **recordChangedUsingPOST**
> NotificationResponseEntity recordChangedUsingPOST(dataPartitionId)

Notifies subscribers that records have changed

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.NotificationApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

NotificationApi apiInstance = new NotificationApi();
String dataPartitionId = "dataPartitionId_example"; // String | tenant
try {
    NotificationResponseEntity result = apiInstance.recordChangedUsingPOST(dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling NotificationApi#recordChangedUsingPOST");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| tenant |

### Return type

[**NotificationResponseEntity**](NotificationResponseEntity.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

