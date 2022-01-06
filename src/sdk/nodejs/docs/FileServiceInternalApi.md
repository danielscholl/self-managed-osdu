# SelfManagedOsdu.FileServiceInternalApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_**](FileServiceInternalApi.md#allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_) | **POST** /api/file/v2/getFileList | 
[**returnsFileLocationAndDriver_**](FileServiceInternalApi.md#returnsFileLocationAndDriver_) | **POST** /api/file/v2/getFileLocation | 


<a name="allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_"></a>
# **allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_**
> FileListResponse allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_(dataPartitionId, opts)



Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceInternalApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.FileListRequest() // FileListRequest | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileListRequest**](FileListRequest.md)|  | [optional] 

### Return type

[**FileListResponse**](FileListResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="returnsFileLocationAndDriver_"></a>
# **returnsFileLocationAndDriver_**
> FileLocationResponse returnsFileLocationAndDriver_(dataPartitionId, opts)



Returns file `Location` and `Driver`.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceInternalApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.FileLocationRequest() // FileLocationRequest | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.returnsFileLocationAndDriver_(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileLocationRequest**](FileLocationRequest.md)|  | [optional] 

### Return type

[**FileLocationResponse**](FileLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

