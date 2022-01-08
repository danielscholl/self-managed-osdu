# FileServiceApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deletesMetadataRecordFileForTheGivenId**](FileServiceApi.md#deletesMetadataRecordFileForTheGivenId) | **DELETE** /api/file/v2/files/{Id}/metadata | Deletes metadata record &amp; file assocaited with that record for the given id
[**getALocationInLandingZoneToUploadAFile_**](FileServiceApi.md#getALocationInLandingZoneToUploadAFile_) | **POST** /api/file/v2/getLocation | Get a location in Landing Zone to upload a file.
[**getTheLocationToUploadAFile**](FileServiceApi.md#getTheLocationToUploadAFile) | **GET** /api/file/v2/files/uploadURL | Get a location in Landing Zone to upload a file.
[**getsMetadataRecordForTheGivenId**](FileServiceApi.md#getsMetadataRecordForTheGivenId) | **GET** /api/file/v2/files/{Id}/metadata | Gets metadata record for the given id
[**getsURLToDownloadTheFileAssociatedWithTheGivenId_**](FileServiceApi.md#getsURLToDownloadTheFileAssociatedWithTheGivenId_) | **GET** /api/file/v2/files/{Id}/DownloadURL | Gets a URL to download the file
[**publishFileMetadataForAFile_**](FileServiceApi.md#publishFileMetadataForAFile_) | **POST** /api/file/v2/files/metadata | Creates metadata for a file


<a name="deletesMetadataRecordFileForTheGivenId"></a>
# **deletesMetadataRecordFileForTheGivenId**
> deletesMetadataRecordFileForTheGivenId(dataPartitionId, id)

Deletes metadata record &amp; file assocaited with that record for the given id

Deletes the File metadata record identified by the given id and file associated with that metadata record. **Required roles**: &#39;users.datalake.editors&#39;  or &#39;users.datalake.admins&#39;.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.FileServiceApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceApi apiInstance = new FileServiceApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
String id = "id_example"; // String | File metadata record Id.
try {
    apiInstance.deletesMetadataRecordFileForTheGivenId(dataPartitionId, id);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceApi#deletesMetadataRecordFileForTheGivenId");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. |
 **id** | **String**| File metadata record Id. |

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getALocationInLandingZoneToUploadAFile_"></a>
# **getALocationInLandingZoneToUploadAFile_**
> FileLandingZoneLocationResponse getALocationInLandingZoneToUploadAFile_(dataPartitionId, body)

Get a location in Landing Zone to upload a file.

Create a new location in the landing zone to upload a file. **Required roles**: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; or &#39;users.datalake.ops&#39;. 

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.FileServiceApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceApi apiInstance = new FileServiceApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
FileLocationRequest body = new FileLocationRequest(); // FileLocationRequest | 
try {
    FileLandingZoneLocationResponse result = apiInstance.getALocationInLandingZoneToUploadAFile_(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceApi#getALocationInLandingZoneToUploadAFile_");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. |
 **body** | [**FileLocationRequest**](FileLocationRequest.md)|  | [optional]

### Return type

[**FileLandingZoneLocationResponse**](FileLandingZoneLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getTheLocationToUploadAFile"></a>
# **getTheLocationToUploadAFile**
> FileSourceLocationResponse getTheLocationToUploadAFile(dataPartitionId)

Get a location in Landing Zone to upload a file.

Gets a temporary signed URL to upload a file.The generated URL is time bound and expires after 24 hours. User will receive a FileSource in the response.This is the relative path where the uploaded file will persist. Once the file is uploaded, FileSource can then be used to post metadata of the file. The uploaded file gets automatically deleted, if the metadata is not posted within 24 hours of uploading the file. **Required roles**: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; or &#39;users.datalake.ops&#39;.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.FileServiceApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceApi apiInstance = new FileServiceApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
try {
    FileSourceLocationResponse result = apiInstance.getTheLocationToUploadAFile(dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceApi#getTheLocationToUploadAFile");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. |

### Return type

[**FileSourceLocationResponse**](FileSourceLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getsMetadataRecordForTheGivenId"></a>
# **getsMetadataRecordForTheGivenId**
> FileRecordVersion getsMetadataRecordForTheGivenId(dataPartitionId, id)

Gets metadata record for the given id

Gets the latest version of File metadata record identified by the given id. **Required roles**: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; or &#39;users.datalake.ops&#39;.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.FileServiceApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceApi apiInstance = new FileServiceApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
String id = "id_example"; // String | File metadata record Id.
try {
    FileRecordVersion result = apiInstance.getsMetadataRecordForTheGivenId(dataPartitionId, id);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceApi#getsMetadataRecordForTheGivenId");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. |
 **id** | **String**| File metadata record Id. |

### Return type

[**FileRecordVersion**](FileRecordVersion.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getsURLToDownloadTheFileAssociatedWithTheGivenId_"></a>
# **getsURLToDownloadTheFileAssociatedWithTheGivenId_**
> FileDownloadResponse getsURLToDownloadTheFileAssociatedWithTheGivenId_(dataPartitionId, id, expiryTime)

Gets a URL to download the file

Gets a URL for downloading the file associated with the unique &#x60;id&#x60;. **Required roles**: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; or &#39;users.datalake.ops&#39;.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.FileServiceApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceApi apiInstance = new FileServiceApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
String id = "id_example"; // String | File Metadata record Id.
String expiryTime = "expiryTime_example"; // String | The Time for which Signed URL to be valid. Accepted Regex patterns are \"^[0-9]+M$\", \"^[0-9]+H$\", \"^[0-9]+D$\" denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days.
try {
    FileDownloadResponse result = apiInstance.getsURLToDownloadTheFileAssociatedWithTheGivenId_(dataPartitionId, id, expiryTime);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceApi#getsURLToDownloadTheFileAssociatedWithTheGivenId_");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. |
 **id** | **String**| File Metadata record Id. |
 **expiryTime** | **String**| The Time for which Signed URL to be valid. Accepted Regex patterns are \&quot;^[0-9]+M$\&quot;, \&quot;^[0-9]+H$\&quot;, \&quot;^[0-9]+D$\&quot; denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days. | [optional]

### Return type

[**FileDownloadResponse**](FileDownloadResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="publishFileMetadataForAFile_"></a>
# **publishFileMetadataForAFile_**
> FileMetadataResponse publishFileMetadataForAFile_(dataPartitionId, body)

Creates metadata for a file

This API creates a metadata record for a file that is already uploaded. The Metadata is linked to the file via &#x60;FileSource&#x60; provided in the request body. If &#x60;FileSource&#x60; attribute is missing in the request body or there is no file present, then the request fails with an error. When metadata is successfully updated in the system, it returns the &#x60;Id&#x60; of the file metadata record. **Required roles**: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; or &#39;users.datalake.ops&#39;.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.FileServiceApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

FileServiceApi apiInstance = new FileServiceApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
FileMetadata body = new FileMetadata(); // FileMetadata | File metadata content
try {
    FileMetadataResponse result = apiInstance.publishFileMetadataForAFile_(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling FileServiceApi#publishFileMetadataForAFile_");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. |
 **body** | [**FileMetadata**](FileMetadata.md)| File metadata content | [optional]

### Return type

[**FileMetadataResponse**](FileMetadataResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

