# DeliveryApiApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**returnsDeliveryInstructionsForFileSUsingSRNs**](DeliveryApiApi.md#returnsDeliveryInstructionsForFileSUsingSRNs) | **POST** /api/file/v2/delivery/getFileSignedUrl | 


<a name="returnsDeliveryInstructionsForFileSUsingSRNs"></a>
# **returnsDeliveryInstructionsForFileSUsingSRNs**
> FileDeliveryGetFileSignedURLResponse returnsDeliveryInstructionsForFileSUsingSRNs(dataPartitionId, body)



Returns delivery instructions for File(s) using SRNs

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.DeliveryApiApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

DeliveryApiApi apiInstance = new DeliveryApiApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
FileDeliveryGetFileSignedURLRequest body = new FileDeliveryGetFileSignedURLRequest(); // FileDeliveryGetFileSignedURLRequest | 
try {
    FileDeliveryGetFileSignedURLResponse result = apiInstance.returnsDeliveryInstructionsForFileSUsingSRNs(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DeliveryApiApi#returnsDeliveryInstructionsForFileSUsingSRNs");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. |
 **body** | [**FileDeliveryGetFileSignedURLRequest**](FileDeliveryGetFileSignedURLRequest.md)|  | [optional]

### Return type

[**FileDeliveryGetFileSignedURLResponse**](FileDeliveryGetFileSignedURLResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

