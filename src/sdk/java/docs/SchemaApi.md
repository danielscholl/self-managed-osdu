# SchemaApi

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

Adds a schema to the schema repository. The schemaIdentity must be unique. The &#x60;authority&#x60;, &#x60;source&#x60; and &#x60;entityType&#x60; will be registered if not present. If lower minor versions are registered the service validates the new schema against breaking changes; if breaking changes are discovered the request fails. **Note:** The schema must not reference other schemas with status &#x60;DEVELOPMENT&#x60;. Scope to a schema will be set by system based on partition id (&#x60;SHARED&#x60; for common tenant and &#x60;INTERNAL&#x60; for private tenant). Required roles &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; groups to create schema.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SchemaApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SchemaApi apiInstance = new SchemaApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
SchemaRequest body = new SchemaRequest(); // SchemaRequest | 
try {
    SchemaInfo result = apiInstance.createSchema(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling SchemaApi#createSchema");
    e.printStackTrace();
}
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

Retrieve a schema using its system defined id. Required roles &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; groups to get the schema.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SchemaApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SchemaApi apiInstance = new SchemaApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
String id = "id_example"; // String | the system id of the schema
try {
    Object result = apiInstance.getSchema(dataPartitionId, id);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling SchemaApi#getSchema");
    e.printStackTrace();
}
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
> SchemaInfoResponse searchSchemaInfoRepository(dataPartitionId, authority, source, entityType, schemaVersionMajor, schemaVersionMinor, status, scope, latestVersion, limit, offset)

Searches schemaInfo repository

Searches for information of available schema (SchemInfo) in schema repository. Supports options to filter out the search contents. Required roles &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; groups to get the schema.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SchemaApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SchemaApi apiInstance = new SchemaApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
String authority = "*"; // String | pass an optional string to search for a specific authority
String source = "*"; // String | pass an optional string to search for a specific source
String entityType = "*"; // String | pass an optional string to search for a specific entityType
String schemaVersionMajor = "*"; // String | pass an optional string to search for a specific schemaVersionMajor
String schemaVersionMinor = "*"; // String | pass an optional string to search for a specific schemaVersionMinor
String status = "PUBLISHED"; // String | The schema status specification
String scope = "INTERNAL"; // String | The scope or schema visibility specification
Boolean latestVersion = false; // Boolean | if True, only return the latest version
Integer limit = 56; // Integer | maximum number of schema records to return
Integer offset = 56; // Integer | number of records to skip for pagination
try {
    SchemaInfoResponse result = apiInstance.searchSchemaInfoRepository(dataPartitionId, authority, source, entityType, schemaVersionMajor, schemaVersionMinor, status, scope, latestVersion, limit, offset);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling SchemaApi#searchSchemaInfoRepository");
    e.printStackTrace();
}
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
 **status** | **String**| The schema status specification | [optional] [default to PUBLISHED] [enum: PUBLISHED, DEVELOPMENT, OBSOLETE]
 **scope** | **String**| The scope or schema visibility specification | [optional] [default to INTERNAL] [enum: SHARED, INTERNAL]
 **latestVersion** | **Boolean**| if True, only return the latest version | [optional] [default to false]
 **limit** | **Integer**| maximum number of schema records to return | [optional]
 **offset** | **Integer**| number of records to skip for pagination | [optional]

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

Creates a new schema or updates an already existing schema with status &#x60;DEVELOPMENT&#x60; in the schema repository. If a user tries to create/update a schema with status other then &#x60;DEVELOPMENT&#x60;, API will throw an exception. Any schema instance with the same schemaIdentity is replaced (in contrast to the immutability of &#x60;PUBLISHED&#x60; or &#x60;OBSOLETE&#x60; schemas). A schema state can also be changed from &#x60;DEVELOPMENT&#x60; to &#x60;PUBLISHED&#x60; or &#x60;OBSOLETE&#x60; while updating schema content or by providing the same schema content. **Note:** The schema may refer to other schema definitions in &#x60;DEVELOPMENT&#x60; state. If those schemas are updated themselves, it is the developer&#39;s responsibility to PUT the dependent schemas again to update the schemas. Scope for a schema can&#39;t be updated, its a system defined value. Required roles  &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39; groups to update schema.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SchemaApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SchemaApi apiInstance = new SchemaApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
SchemaRequest body = new SchemaRequest(); // SchemaRequest | SchemaRequest
try {
    SchemaInfo result = apiInstance.updateSchema(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling SchemaApi#updateSchema");
    e.printStackTrace();
}
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

