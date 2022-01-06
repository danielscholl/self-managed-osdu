# FileServiceInternalApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_**](FileServiceInternalApi.md#allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_) | **POST** /api/file/v2/getFileList | 
[**returnsFileLocationAndDriver_**](FileServiceInternalApi.md#returnsFileLocationAndDriver_) | **POST** /api/file/v2/getFileLocation | 


<a name="allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_"></a>
# **allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_**
> FileListResponse allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_(dataPartitionId, body)



Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.FileServiceInternalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceInternalApi apiInstance = new FileServiceInternalApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
FileListRequest body = new FileListRequest(); // FileListRequest | 
try {
    FileListResponse result = apiInstance.allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceInternalApi#allowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_");
    e.printStackTrace();
}
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
> FileLocationResponse returnsFileLocationAndDriver_(dataPartitionId, body)



Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.FileServiceInternalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceInternalApi apiInstance = new FileServiceInternalApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
FileLocationRequest body = new FileLocationRequest(); // FileLocationRequest | 
try {
    FileLocationResponse result = apiInstance.returnsFileLocationAndDriver_(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceInternalApi#returnsFileLocationAndDriver_");
    e.printStackTrace();
}
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

