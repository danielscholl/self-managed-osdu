# SearchApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteIndex**](SearchApi.md#deleteIndex) | **DELETE** /api/search/v2/index/{kind} | Deletes all documents from index for given &#39;kind&#39;.
[**getKindSchema**](SearchApi.md#getKindSchema) | **GET** /api/search/v2/index/schema/{kind} | Returns the index schema for given &#39;kind&#39;.
[**queryRecords**](SearchApi.md#queryRecords) | **POST** /api/search/v2/query | Queries the index for the specified kind using the input query string.
[**queryWithCursor**](SearchApi.md#queryWithCursor) | **POST** /api/search/v2/query_with_cursor | Query the index using cursor and optionally return only requested fields.


<a name="deleteIndex"></a>
# **deleteIndex**
> deleteIndex(osDUAccountId, kind, osDUOnBehalfOf)

Deletes all documents from index for given &#39;kind&#39;.

The API can be used  to purge all indexed documents for a kind. Required access level to use this API is service.search.admin

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SearchApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SearchApi apiInstance = new SearchApi();
String osDUAccountId = "osDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
String kind = "kind_example"; // String | Kind of the record.
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
try {
    apiInstance.deleteIndex(osDUAccountId, kind, osDUOnBehalfOf);
} catch (ApiException e) {
    System.err.println("Exception when calling SearchApi#deleteIndex");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. |
 **kind** | **String**| Kind of the record. |
 **osDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional]

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getKindSchema"></a>
# **getKindSchema**
> String getKindSchema(osDUAccountId, kind, osDUOnBehalfOf)

Returns the index schema for given &#39;kind&#39;.

The API returns the schema for a given kind which is used find what attributes are indexed and their respective data types (at index time). Required access levels to use this API are service.search.user, service.search.admin

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SearchApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SearchApi apiInstance = new SearchApi();
String osDUAccountId = "osDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
String kind = "kind_example"; // String | Kind of the record.
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
try {
    String result = apiInstance.getKindSchema(osDUAccountId, kind, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling SearchApi#getKindSchema");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. |
 **kind** | **String**| Kind of the record. |
 **osDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional]

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="queryRecords"></a>
# **queryRecords**
> SearchQueryResponse queryRecords(osDUAccountId, body, osDUOnBehalfOf)

Queries the index for the specified kind using the input query string.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SearchApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SearchApi apiInstance = new SearchApi();
String osDUAccountId = "osDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
SearchQueryRequest body = new SearchQueryRequest(); // SearchQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
try {
    SearchQueryResponse result = apiInstance.queryRecords(osDUAccountId, body, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling SearchApi#queryRecords");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. |
 **body** | [**SearchQueryRequest**](SearchQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. |
 **osDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional]

### Return type

[**SearchQueryResponse**](SearchQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="queryWithCursor"></a>
# **queryWithCursor**
> SearchCursorQueryResponse queryWithCursor(osDUAccountId, body, osDUOnBehalfOf)

Query the index using cursor and optionally return only requested fields.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data. It can be used to retrieve large numbers of results (or even all results) from a single search request, in much the same way as you would use a cursor on a traditional database.

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.SearchApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

SearchApi apiInstance = new SearchApi();
String osDUAccountId = "osDUAccountId_example"; // String | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
SearchCursorQueryRequest body = new SearchCursorQueryRequest(); // SearchCursorQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token.
try {
    SearchCursorQueryResponse result = apiInstance.queryWithCursor(osDUAccountId, body, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling SearchApi#queryWithCursor");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. |
 **body** | [**SearchCursorQueryRequest**](SearchCursorQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. |
 **osDUOnBehalfOf** | **String**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional]

### Return type

[**SearchCursorQueryResponse**](SearchCursorQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

