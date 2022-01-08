# SelfManagedOsdu.FileServiceApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deletesMetadataRecordFileForTheGivenId**](FileServiceApi.md#deletesMetadataRecordFileForTheGivenId) | **DELETE** /api/file/v2/files/{Id}/metadata | Deletes metadata record & file assocaited with that record for the given id
[**getALocationInLandingZoneToUploadAFile_**](FileServiceApi.md#getALocationInLandingZoneToUploadAFile_) | **POST** /api/file/v2/getLocation | Get a location in Landing Zone to upload a file.
[**getTheLocationToUploadAFile**](FileServiceApi.md#getTheLocationToUploadAFile) | **GET** /api/file/v2/files/uploadURL | Get a location in Landing Zone to upload a file.
[**getsMetadataRecordForTheGivenId**](FileServiceApi.md#getsMetadataRecordForTheGivenId) | **GET** /api/file/v2/files/{Id}/metadata | Gets metadata record for the given id
[**getsURLToDownloadTheFileAssociatedWithTheGivenId_**](FileServiceApi.md#getsURLToDownloadTheFileAssociatedWithTheGivenId_) | **GET** /api/file/v2/files/{Id}/DownloadURL | Gets a URL to download the file
[**publishFileMetadataForAFile_**](FileServiceApi.md#publishFileMetadataForAFile_) | **POST** /api/file/v2/files/metadata | Creates metadata for a file


<a name="deletesMetadataRecordFileForTheGivenId"></a>
# **deletesMetadataRecordFileForTheGivenId**
> deletesMetadataRecordFileForTheGivenId(dataPartitionId, id)

Deletes metadata record & file assocaited with that record for the given id

Deletes the File metadata record identified by the given id and file associated with that metadata record. **Required roles**: 'users.datalake.editors'  or 'users.datalake.admins'.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

var id = "id_example"; // String | File metadata record Id.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deletesMetadataRecordFileForTheGivenId(dataPartitionId, id, callback);
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
> FileLandingZoneLocationResponse getALocationInLandingZoneToUploadAFile_(dataPartitionId, opts)

Get a location in Landing Zone to upload a file.

Create a new location in the landing zone to upload a file. **Required roles**: 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'. 

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceApi();

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
apiInstance.getALocationInLandingZoneToUploadAFile_(dataPartitionId, opts, callback);
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

Gets a temporary signed URL to upload a file.The generated URL is time bound and expires after 24 hours. User will receive a FileSource in the response.This is the relative path where the uploaded file will persist. Once the file is uploaded, FileSource can then be used to post metadata of the file. The uploaded file gets automatically deleted, if the metadata is not posted within 24 hours of uploading the file. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getTheLocationToUploadAFile(dataPartitionId, callback);
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

Gets the latest version of File metadata record identified by the given id. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

var id = "id_example"; // String | File metadata record Id.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getsMetadataRecordForTheGivenId(dataPartitionId, id, callback);
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
> FileDownloadResponse getsURLToDownloadTheFileAssociatedWithTheGivenId_(dataPartitionId, id, opts)

Gets a URL to download the file

Gets a URL for downloading the file associated with the unique `id`. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

var id = "id_example"; // String | File Metadata record Id.

var opts = { 
  'expiryTime': "expiryTime_example" // String | The Time for which Signed URL to be valid. Accepted Regex patterns are \"^[0-9]+M$\", \"^[0-9]+H$\", \"^[0-9]+D$\" denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getsURLToDownloadTheFileAssociatedWithTheGivenId_(dataPartitionId, id, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **id** | **String**| File Metadata record Id. | 
 **expiryTime** | **String**| The Time for which Signed URL to be valid. Accepted Regex patterns are \"^[0-9]+M$\", \"^[0-9]+H$\", \"^[0-9]+D$\" denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days. | [optional] 

### Return type

[**FileDownloadResponse**](FileDownloadResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="publishFileMetadataForAFile_"></a>
# **publishFileMetadataForAFile_**
> FileMetadataResponse publishFileMetadataForAFile_(dataPartitionId, opts)

Creates metadata for a file

This API creates a metadata record for a file that is already uploaded. The Metadata is linked to the file via `FileSource` provided in the request body. If `FileSource` attribute is missing in the request body or there is no file present, then the request fails with an error. When metadata is successfully updated in the system, it returns the `Id` of the file metadata record. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.FileServiceApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.FileMetadata() // FileMetadata | File metadata content
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.publishFileMetadataForAFile_(dataPartitionId, opts, callback);
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

