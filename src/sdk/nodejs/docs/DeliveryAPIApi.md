# SelfManagedOsdu.DeliveryAPIApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**returnsDeliveryInstructionsForFileSUsingSRNs**](DeliveryAPIApi.md#returnsDeliveryInstructionsForFileSUsingSRNs) | **POST** /api/file/v2/delivery/getFileSignedUrl | 


<a name="returnsDeliveryInstructionsForFileSUsingSRNs"></a>
# **returnsDeliveryInstructionsForFileSUsingSRNs**
> FileDeliveryGetFileSignedURLResponse returnsDeliveryInstructionsForFileSUsingSRNs(dataPartitionId, opts)



Returns delivery instructions for File(s) using SRNs

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.DeliveryAPIApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.FileDeliveryGetFileSignedURLRequest() // FileDeliveryGetFileSignedURLRequest | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.returnsDeliveryInstructionsForFileSUsingSRNs(dataPartitionId, opts, callback);
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

