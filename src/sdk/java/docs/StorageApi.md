# StorageApi

All URIs are relative to *https://oak-osdu-dplbhggc-mwt3-gw.westeurope.cloudapp.azure.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrUpdateRecords**](StorageApi.md#createOrUpdateRecords) | **PUT** /records | Create or update records
[**deleteRecord**](StorageApi.md#deleteRecord) | **POST** /records/{id}:delete | Delete record
[**deleteRecords**](StorageApi.md#deleteRecords) | **POST** /records/delete | Soft delete of multiple records
[**fetchRecords**](StorageApi.md#fetchRecords) | **POST** /storage/v2/query/records | Fetch records
[**getAllKinds**](StorageApi.md#getAllKinds) | **GET** /storage/v2/query/kinds | Get all kinds
[**getAllRecordFromKind**](StorageApi.md#getAllRecordFromKind) | **GET** /storage/v2/query/records | Get all record from kind
[**getAllRecordVersions**](StorageApi.md#getAllRecordVersions) | **GET** /records/versions/{id} | Get all record versions
[**getRecord**](StorageApi.md#getRecord) | **GET** /records/{id} | Get record
[**getRecordVersion**](StorageApi.md#getRecordVersion) | **GET** /records/{id}/{version} | Get record version
[**patchUpdateRecords**](StorageApi.md#patchUpdateRecords) | **PATCH** /records | Modify record metadata attributes using patch operations
[**purgeRecord**](StorageApi.md#purgeRecord) | **DELETE** /records/{id} | Purge record


<a name="createOrUpdateRecords"></a>
# **createOrUpdateRecords**
> StorageRecord createOrUpdateRecords(osDUAccountId, skipdupes, body)

Create or update records

The API represents the main injection mechanism into the Data Lake. It allows records creation and/or update. When no record id is provided or when the provided id is not already present in the Data Lake then a new record is created. If the id is related to an existing record in the Data Lake then an update operation takes place and a new version of the record is created. Allowed roles: service.storage.creator and service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
Boolean skipdupes = true; // Boolean | Skip duplicates when updating records with the same value.
List<StorageRecord> body = Arrays.asList(new StorageRecord()); // List<StorageRecord> | 
try {
    StorageRecord result = apiInstance.createOrUpdateRecords(osDUAccountId, skipdupes, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#createOrUpdateRecords");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **skipdupes** | **Boolean**| Skip duplicates when updating records with the same value. | [optional] [default to true]
 **body** | [**List&lt;StorageRecord&gt;**](StorageRecord.md)|  | [optional]

### Return type

[**StorageRecord**](StorageRecord.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteRecord"></a>
# **deleteRecord**
> deleteRecord(id, osDUAccountId)

Delete record

The API performs a logical deletion of the given record. This operation can be reverted later. Allowed roles: service.storage.creator and service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String id = "id_example"; // String | Record id
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
try {
    apiInstance.deleteRecord(id, osDUAccountId);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#deleteRecord");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id |
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

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

The API performs a soft deletion of the given list of records. Required roles: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String dataPartitionId = "dataPartitionId_example"; // String | Partition Id
List<String> partitionInfo = Arrays.asList(new List<String>()); // List<String> | partitionInfo
try {
    apiInstance.deleteRecords(dataPartitionId, partitionInfo);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#deleteRecords");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Partition Id |
 **partitionInfo** | **List&lt;String&gt;**| partitionInfo |

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="fetchRecords"></a>
# **fetchRecords**
> StorageMultiRecordIds fetchRecords(osDUAccountId, body)

Fetch records

The API fetches multiple records at once. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
StorageMultiRecordIds body = new StorageMultiRecordIds(); // StorageMultiRecordIds | 
try {
    StorageMultiRecordIds result = apiInstance.fetchRecords(osDUAccountId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#fetchRecords");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
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
> StorageQueryResponse getAllKinds(osDUAccountId, cursor, limit)

Get all kinds

The API returns a list of all kinds in the specific {Account-Id}. Allowed roles: service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String osDUAccountId = "tenant1"; // String | Account ID is the active account account) which the users choose to use with the Search API.
String cursor = "cursor_example"; // String | Cursor
Integer limit = 10; // Integer | Page Size
try {
    StorageQueryResponse result = apiInstance.getAllKinds(osDUAccountId, cursor, limit);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#getAllKinds");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active account account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **String**| Cursor | [optional]
 **limit** | **Integer**| Page Size | [optional] [default to 10]

### Return type

[**StorageQueryResponse**](StorageQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getAllRecordFromKind"></a>
# **getAllRecordFromKind**
> StorageQueryResponse getAllRecordFromKind(osDUAccountId, cursor, limit, kind)

Get all record from kind

The API returns a list of all record ids which belong to the specified kind. Allowed roles: service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
String cursor = "cursor_example"; // String | Cursor
Integer limit = 10; // Integer | Page Size
String kind = "tenant1:public:well:1.0.2"; // String | Filter Kind
try {
    StorageQueryResponse result = apiInstance.getAllRecordFromKind(osDUAccountId, cursor, limit, kind);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#getAllRecordFromKind");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **String**| Cursor | [optional]
 **limit** | **Integer**| Page Size | [optional] [default to 10]
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
> StorageRecordVersions getAllRecordVersions(id, osDUAccountId)

Get all record versions

The API returns a list containing all versions for the given record id. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String id = "id_example"; // String | Record id
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
try {
    StorageRecordVersions result = apiInstance.getAllRecordVersions(id, osDUAccountId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#getAllRecordVersions");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id |
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

[**StorageRecordVersions**](StorageRecordVersions.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getRecord"></a>
# **getRecord**
> StorageRecordData getRecord(id, osDUAccountId, attribute)

Get record

This API returns the latest version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String id = "id_example"; // String | Record id
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
List<String> attribute = Arrays.asList("attribute_example"); // List<String> | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}.
try {
    StorageRecordData result = apiInstance.getRecord(id, osDUAccountId, attribute);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#getRecord");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id |
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**List&lt;String&gt;**](String.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional]

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getRecordVersion"></a>
# **getRecordVersion**
> StorageRecordData getRecordVersion(id, version, osDUAccountId, attribute)

Get record version

The API retrieves the specific version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String id = "id_example"; // String | Record id
Long version = 789L; // Long | Record version
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
List<String> attribute = Arrays.asList("attribute_example"); // List<String> | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}.
try {
    StorageRecordData result = apiInstance.getRecordVersion(id, version, osDUAccountId, attribute);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#getRecordVersion");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id |
 **version** | **Long**| Record version |
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**List&lt;String&gt;**](String.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional]

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="patchUpdateRecords"></a>
# **patchUpdateRecords**
> StorageBulkUpdateRecordsResponse patchUpdateRecords(osDUAccountId, body)

Modify record metadata attributes using patch operations

The API represents the patch update mechanism for records. It allows updating multiple records in one request. The currently supported operations are replace, add, and remove for Legal Tags, ACLs, and Tags.  Required roles: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
List<StorageRecordBulkUpdateParam> body = Arrays.asList(new StorageRecordBulkUpdateParam()); // List<StorageRecordBulkUpdateParam> | 
try {
    StorageBulkUpdateRecordsResponse result = apiInstance.patchUpdateRecords(osDUAccountId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#patchUpdateRecords");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **body** | [**List&lt;StorageRecordBulkUpdateParam&gt;**](StorageRecordBulkUpdateParam.md)|  | [optional]

### Return type

[**StorageBulkUpdateRecordsResponse**](StorageBulkUpdateRecordsResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="purgeRecord"></a>
# **purgeRecord**
> purgeRecord(id, osDUAccountId)

Purge record

The API performs the physical deletion of the given record and all of its versions. This operation cannot be undone. Allowed roles: service.storage.admin.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.StorageApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

StorageApi apiInstance = new StorageApi();
String id = "id_example"; // String | Record id
String osDUAccountId = "tenant1"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
try {
    apiInstance.purgeRecord(id, osDUAccountId);
} catch (ApiException e) {
    System.err.println("Exception when calling StorageApi#purgeRecord");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Record id |
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

