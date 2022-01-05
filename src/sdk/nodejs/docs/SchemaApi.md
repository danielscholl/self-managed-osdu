# SelfManagedOsdu.SchemaApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSchema**](SchemaApi.md#createSchema) | **POST** /api/schema-service/v1/schema | Adds a schema to the schema repository.
[**getSchema**](SchemaApi.md#getSchema) | **GET** /api/schema-service/v1/schema/{id} | Gets schema from the schema repository.
[**searchSchemaInfoRepository**](SchemaApi.md#searchSchemaInfoRepository) | **GET** /api/schema-service/v1/schema | Searches schemaInfo repository
[**updateSchema**](SchemaApi.md#updateSchema) | **PUT** /api/schema-service/v1/schema | Creates/Updates a schema in development status


<a name="createSchema"></a>
# **createSchema**
> SchemaInfo createSchema(dataPartitionId, body)

Adds a schema to the schema repository.

Adds a schema to the schema repository. The schemaIdentity must be unique. The `authority`, `source` and `entityType` will be registered if not present. If lower minor versions are registered the service validates the new schema against breaking changes; if breaking changes are discovered the request fails. **Note:** The schema must not reference other schemas with status `DEVELOPMENT`. Scope to a schema will be set by system based on partition id (`SHARED` for common tenant and `INTERNAL` for private tenant). Required roles 'users.datalake.editors' or 'users.datalake.admins' groups to create schema.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SchemaApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.

var body = new SelfManagedOsdu.SchemaRequest(); // SchemaRequest | 


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.createSchema(dataPartitionId, body, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **body** | [**SchemaRequest**](SchemaRequest.md)|  | 

### Return type

[**SchemaInfo**](SchemaInfo.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getSchema"></a>
# **getSchema**
> Object getSchema(dataPartitionId, id)

Gets schema from the schema repository.

Retrieve a schema using its system defined id. Required roles 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' groups to get the schema.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SchemaApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.

var id = "id_example"; // String | the system id of the schema


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getSchema(dataPartitionId, id, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **id** | **String**| the system id of the schema | 

### Return type

**Object**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="searchSchemaInfoRepository"></a>
# **searchSchemaInfoRepository**
> SchemaInfoResponse searchSchemaInfoRepository(dataPartitionId, opts)

Searches schemaInfo repository

Searches for information of available schema (SchemInfo) in schema repository. Supports options to filter out the search contents. Required roles 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' groups to get the schema.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SchemaApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.

var opts = { 
  'authority': "*", // String | pass an optional string to search for a specific authority
  'source': "*", // String | pass an optional string to search for a specific source
  'entityType': "*", // String | pass an optional string to search for a specific entityType
  'schemaVersionMajor': "*", // String | pass an optional string to search for a specific schemaVersionMajor
  'schemaVersionMinor': "*", // String | pass an optional string to search for a specific schemaVersionMinor
  'status': "PUBLISHED", // String | The schema status specification
  'scope': "INTERNAL", // String | The scope or schema visibility specification
  'latestVersion': false, // Boolean | if True, only return the latest version
  'limit': 56, // Number | maximum number of schema records to return
  'offset': 56 // Number | number of records to skip for pagination
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.searchSchemaInfoRepository(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **authority** | **String**| pass an optional string to search for a specific authority | [optional] [default to *]
 **source** | **String**| pass an optional string to search for a specific source | [optional] [default to *]
 **entityType** | **String**| pass an optional string to search for a specific entityType | [optional] [default to *]
 **schemaVersionMajor** | **String**| pass an optional string to search for a specific schemaVersionMajor | [optional] [default to *]
 **schemaVersionMinor** | **String**| pass an optional string to search for a specific schemaVersionMinor | [optional] [default to *]
 **status** | **String**| The schema status specification | [optional] [default to PUBLISHED]
 **scope** | **String**| The scope or schema visibility specification | [optional] [default to INTERNAL]
 **latestVersion** | **Boolean**| if True, only return the latest version | [optional] [default to false]
 **limit** | **Number**| maximum number of schema records to return | [optional] 
 **offset** | **Number**| number of records to skip for pagination | [optional] 

### Return type

[**SchemaInfoResponse**](SchemaInfoResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="updateSchema"></a>
# **updateSchema**
> SchemaInfo updateSchema(dataPartitionId, body)

Creates/Updates a schema in development status

Creates a new schema or updates an already existing schema with status `DEVELOPMENT` in the schema repository. If a user tries to create/update a schema with status other then `DEVELOPMENT`, API will throw an exception. Any schema instance with the same schemaIdentity is replaced (in contrast to the immutability of `PUBLISHED` or `OBSOLETE` schemas). A schema state can also be changed from `DEVELOPMENT` to `PUBLISHED` or `OBSOLETE` while updating schema content or by providing the same schema content. **Note:** The schema may refer to other schema definitions in `DEVELOPMENT` state. If those schemas are updated themselves, it is the developer's responsibility to PUT the dependent schemas again to update the schemas. Scope for a schema can't be updated, its a system defined value. Required roles  'users.datalake.editors' or 'users.datalake.admins' groups to update schema.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SchemaApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.

var body = new SelfManagedOsdu.SchemaRequest(); // SchemaRequest | SchemaRequest


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.updateSchema(dataPartitionId, body, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **body** | [**SchemaRequest**](SchemaRequest.md)| SchemaRequest | 

### Return type

[**SchemaInfo**](SchemaInfo.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

