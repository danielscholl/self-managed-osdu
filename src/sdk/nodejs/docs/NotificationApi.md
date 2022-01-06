# SelfManagedOsdu.NotificationApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**recordChangedUsingPOST**](NotificationApi.md#recordChangedUsingPOST) | **POST** /api/notification/v1/push-handlers/records-changed | Notifies subscribers that records have changed


<a name="recordChangedUsingPOST"></a>
# **recordChangedUsingPOST**
> NotificationResponseEntity recordChangedUsingPOST(dataPartitionId)

Notifies subscribers that records have changed

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.NotificationApi();

var dataPartitionId = "dataPartitionId_example"; // String | tenant


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.recordChangedUsingPOST(dataPartitionId, callback);
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

