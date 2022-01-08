# SelfManagedOsdu.SearchApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteIndex**](SearchApi.md#deleteIndex) | **DELETE** /api/search/v2/index/{kind} | Deletes all documents from index for given 'kind'.
[**getKindSchema**](SearchApi.md#getKindSchema) | **GET** /api/search/v2/index/schema/{kind} | Returns the index schema for given 'kind'.
[**queryRecords**](SearchApi.md#queryRecords) | **POST** /api/search/v2/query | Queries the index for the specified kind using the input query string.
[**queryWithCursor**](SearchApi.md#queryWithCursor) | **POST** /api/search/v2/query_with_cursor | Query the index using cursor and optionally return only requested fields.


<a name="deleteIndex"></a>
# **deleteIndex**
> deleteIndex(oSDUAccountId, kind, opts)

Deletes all documents from index for given 'kind'.

The API can be used  to purge all indexed documents for a kind. Required access level to use this API is service.search.admin

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SearchApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var kind = "kind_example"; // String | Kind of the record.

var opts = { 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteIndex(oSDUAccountId, kind, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | 
 **kind** | **String**| Kind of the record. | 
 **oSDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getKindSchema"></a>
# **getKindSchema**
> 'String' getKindSchema(oSDUAccountId, kind, opts)

Returns the index schema for given 'kind'.

The API returns the schema for a given kind which is used find what attributes are indexed and their respective data types (at index time). Required access levels to use this API are service.search.user, service.search.admin

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SearchApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var kind = "kind_example"; // String | Kind of the record.

var opts = { 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getKindSchema(oSDUAccountId, kind, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | 
 **kind** | **String**| Kind of the record. | 
 **oSDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

**'String'**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="queryRecords"></a>
# **queryRecords**
> SearchQueryResponse queryRecords(oSDUAccountId, body, opts)

Queries the index for the specified kind using the input query string.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SearchApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var body = new SelfManagedOsdu.SearchQueryRequest(); // SearchQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.

var opts = { 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.queryRecords(oSDUAccountId, body, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | 
 **body** | [**SearchQueryRequest**](SearchQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. | 
 **oSDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

[**SearchQueryResponse**](SearchQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="queryWithCursor"></a>
# **queryWithCursor**
> SearchCursorQueryResponse queryWithCursor(oSDUAccountId, body, opts)

Query the index using cursor and optionally return only requested fields.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data. It can be used to retrieve large numbers of results (or even all results) from a single search request, in much the same way as you would use a cursor on a traditional database.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.SearchApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.

var body = new SelfManagedOsdu.SearchCursorQueryRequest(); // SearchCursorQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.

var opts = { 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.queryWithCursor(oSDUAccountId, body, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. | 
 **body** | [**SearchCursorQueryRequest**](SearchCursorQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. | 
 **oSDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

[**SearchCursorQueryResponse**](SearchCursorQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

