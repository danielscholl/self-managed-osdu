# SelfManagedOsdu.StorageApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrUpdateRecords**](StorageApi.md#createOrUpdateRecords) | **PUT** /api/storage/v2/records | Create or update records
[**deleteRecord**](StorageApi.md#deleteRecord) | **POST** /api/records/{id}:delete | Delete record
[**deleteRecords**](StorageApi.md#deleteRecords) | **POST** /api/storage/v2/records/delete | Soft delete of multiple records
[**fetchRecords**](StorageApi.md#fetchRecords) | **POST** /api/storage/v2/query/records | Fetch records
[**getAllKinds**](StorageApi.md#getAllKinds) | **GET** /api/storage/v2/query/kinds | Get all kinds
[**getAllRecordFromKind**](StorageApi.md#getAllRecordFromKind) | **GET** /api/storage/v2/query/records | Get all record from kind
[**getAllRecordVersions**](StorageApi.md#getAllRecordVersions) | **GET** /api/storage/v2/records/versions/{id} | Get all record versions
[**getRecord**](StorageApi.md#getRecord) | **GET** /api/storage/v2/records/{id} | Get record
[**getRecordVersion**](StorageApi.md#getRecordVersion) | **GET** /api/storage/v2/records/{id}/{version} | Get record version
[**patchUpdateRecords**](StorageApi.md#patchUpdateRecords) | **PATCH** /api/storage/v2/records | Modify record metadata attributes using patch operations
[**purgeRecord**](StorageApi.md#purgeRecord) | **DELETE** /api/storage/v2/records/{id} | Purge record


<a name="createOrUpdateRecords"></a>
# **createOrUpdateRecords**
> StorageRecord createOrUpdateRecords(oSDUAccountId, opts)

Create or update records

The API represents the main injection mechanism into the Data Lake. It allows records creation and/or update. When no record id is provided or when the provided id is not already present in the Data Lake then a new record is created. If the id is related to an existing record in the Data Lake then an update operation takes place and a new version of the record is created. Allowed roles: service.storage.creator and service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var opts = { 
  'skipdupes': true, // Boolean | Skip duplicates when updating records with the same value.
  'body': [new SelfManagedOsdu.StorageRecord()] // [StorageRecord] | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.createOrUpdateRecords(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]
 **skipdupes** | **Boolean**| Skip duplicates when updating records with the same value. | [optional] [default to true]
 **body** | [**[StorageRecord]**](StorageRecord.md)|  | [optional] 

### Return type

[**StorageRecord**](StorageRecord.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteRecord"></a>
# **deleteRecord**
> deleteRecord(id, oSDUAccountId)

Delete record

The API performs a logical deletion of the given record. This operation can be reverted later. Allowed roles: service.storage.creator and service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var id = "id_example"; // String | Record id

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteRecord(id, oSDUAccountId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id | 
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteRecords"></a>
# **deleteRecords**
> deleteRecords(dataPartitionId, partitionInfo)

Soft delete of multiple records

The API performs a soft deletion of the given list of records. Required roles: 'users.datalake.editors' or 'users.datalake.admins'.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var dataPartitionId = "dataPartitionId_example"; // String | Partition Id

var partitionInfo = [new SelfManagedOsdu.[String]()]; // [String] | partitionInfo


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteRecords(dataPartitionId, partitionInfo, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Partition Id | 
 **partitionInfo** | **[String]**| partitionInfo | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="fetchRecords"></a>
# **fetchRecords**
> StorageMultiRecordIds fetchRecords(oSDUAccountId, opts)

Fetch records

The API fetches multiple records at once. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var opts = { 
  'body': new SelfManagedOsdu.StorageMultiRecordIds() // StorageMultiRecordIds | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.fetchRecords(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]
 **body** | [**StorageMultiRecordIds**](StorageMultiRecordIds.md)|  | [optional] 

### Return type

[**StorageMultiRecordIds**](StorageMultiRecordIds.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getAllKinds"></a>
# **getAllKinds**
> StorageQueryResponse getAllKinds(oSDUAccountId, opts)

Get all kinds

The API returns a list of all kinds in the specific {Account-Id}. Allowed roles: service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var oSDUAccountId = "tenant1"; // String | Account ID is the active account account) which the users choose to use with the Search API.

var opts = { 
  'cursor': "cursor_example", // String | Cursor
  'limit': 10 // Number | Page Size
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getAllKinds(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active account account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **String**| Cursor | [optional] 
 **limit** | **Number**| Page Size | [optional] [default to 10]

### Return type

[**StorageQueryResponse**](StorageQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getAllRecordFromKind"></a>
# **getAllRecordFromKind**
> StorageQueryResponse getAllRecordFromKind(oSDUAccountId, opts)

Get all record from kind

The API returns a list of all record ids which belong to the specified kind. Allowed roles: service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var opts = { 
  'cursor': "cursor_example", // String | Cursor
  'limit': 10, // Number | Page Size
  'kind': "tenant1:public:well:1.0.2" // String | Filter Kind
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getAllRecordFromKind(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **String**| Cursor | [optional] 
 **limit** | **Number**| Page Size | [optional] [default to 10]
 **kind** | **String**| Filter Kind | [optional] [default to tenant1:public:well:1.0.2]

### Return type

[**StorageQueryResponse**](StorageQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getAllRecordVersions"></a>
# **getAllRecordVersions**
> StorageRecordVersions getAllRecordVersions(id, oSDUAccountId)

Get all record versions

The API returns a list containing all versions for the given record id. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var id = "id_example"; // String | Record id

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getAllRecordVersions(id, oSDUAccountId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id | 
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

[**StorageRecordVersions**](StorageRecordVersions.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getRecord"></a>
# **getRecord**
> StorageRecordData getRecord(id, oSDUAccountId, opts)

Get record

This API returns the latest version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var id = "id_example"; // String | Record id

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var opts = { 
  'attribute': ["attribute_example"] // [String] | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getRecord(id, oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id | 
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**[String]**](String.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional] 

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getRecordVersion"></a>
# **getRecordVersion**
> StorageRecordData getRecordVersion(id, version, oSDUAccountId, opts)

Get record version

The API retrieves the specific version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var id = "id_example"; // String | Record id

var version = 789; // Number | Record version

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var opts = { 
  'attribute': ["attribute_example"] // [String] | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getRecordVersion(id, version, oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id | 
 **version** | **Number**| Record version | 
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**[String]**](String.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional] 

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="patchUpdateRecords"></a>
# **patchUpdateRecords**
> StorageBulkUpdateRecordsResponse patchUpdateRecords(oSDUAccountId, opts)

Modify record metadata attributes using patch operations

The API represents the patch update mechanism for records. It allows updating multiple records in one request. The currently supported operations are replace, add, and remove for Legal Tags, ACLs, and Tags.  Required roles: 'users.datalake.editors' or 'users.datalake.admins'.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var opts = { 
  'body': [new SelfManagedOsdu.StorageRecordBulkUpdateParam()] // [StorageRecordBulkUpdateParam] | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.patchUpdateRecords(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]
 **body** | [**[StorageRecordBulkUpdateParam]**](StorageRecordBulkUpdateParam.md)|  | [optional] 

### Return type

[**StorageBulkUpdateRecordsResponse**](StorageBulkUpdateRecordsResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="purgeRecord"></a>
# **purgeRecord**
> purgeRecord(id, oSDUAccountId)

Purge record

The API performs the physical deletion of the given record and all of its versions. This operation cannot be undone. Allowed roles: service.storage.admin.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.StorageApi();

var id = "id_example"; // String | Record id

var oSDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.purgeRecord(id, oSDUAccountId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id | 
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

