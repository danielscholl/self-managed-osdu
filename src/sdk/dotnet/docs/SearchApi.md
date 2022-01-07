# OsduClient.Api.SearchApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteIndex**](SearchApi.md#deleteindex) | **DELETE** /api/search/v2/index/{kind} | Deletes all documents from index for given &#39;kind&#39;.
[**GetKindSchema**](SearchApi.md#getkindschema) | **GET** /api/search/v2/index/schema/{kind} | Returns the index schema for given &#39;kind&#39;.
[**QueryRecords**](SearchApi.md#queryrecords) | **POST** /api/search/v2/query | Queries the index for the specified kind using the input query string.
[**QueryWithCursor**](SearchApi.md#querywithcursor) | **POST** /api/search/v2/query_with_cursor | Query the index using cursor and optionally return only requested fields.


<a name="deleteindex"></a>
# **DeleteIndex**
> void DeleteIndex (string oSDUAccountId, string kind, string oSDUOnBehalfOf = null)

Deletes all documents from index for given 'kind'.

The API can be used  to purge all indexed documents for a kind. Required access level to use this API is service.search.admin

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteIndexExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SearchApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
            var kind = kind_example;  // string | Kind of the record.
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional) 

            try
            {
                // Deletes all documents from index for given 'kind'.
                apiInstance.DeleteIndex(oSDUAccountId, kind, oSDUOnBehalfOf);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SearchApi.DeleteIndex: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **kind** | **string**| Kind of the record. | 
 **oSDUOnBehalfOf** | **string**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getkindschema"></a>
# **GetKindSchema**
> string GetKindSchema (string oSDUAccountId, string kind, string oSDUOnBehalfOf = null)

Returns the index schema for given 'kind'.

The API returns the schema for a given kind which is used find what attributes are indexed and their respective data types (at index time). Required access levels to use this API are service.search.user, service.search.admin

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetKindSchemaExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SearchApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
            var kind = kind_example;  // string | Kind of the record.
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional) 

            try
            {
                // Returns the index schema for given 'kind'.
                string result = apiInstance.GetKindSchema(oSDUAccountId, kind, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SearchApi.GetKindSchema: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **kind** | **string**| Kind of the record. | 
 **oSDUOnBehalfOf** | **string**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

**string**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="queryrecords"></a>
# **QueryRecords**
> SearchQueryResponse QueryRecords (string oSDUAccountId, SearchQueryRequest body, string oSDUOnBehalfOf = null)

Queries the index for the specified kind using the input query string.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class QueryRecordsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SearchApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
            var body = new SearchQueryRequest(); // SearchQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional) 

            try
            {
                // Queries the index for the specified kind using the input query string.
                SearchQueryResponse result = apiInstance.QueryRecords(oSDUAccountId, body, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SearchApi.QueryRecords: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **body** | [**SearchQueryRequest**](SearchQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. | 
 **oSDUOnBehalfOf** | **string**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

[**SearchQueryResponse**](SearchQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="querywithcursor"></a>
# **QueryWithCursor**
> SearchCursorQueryResponse QueryWithCursor (string oSDUAccountId, SearchCursorQueryRequest body, string oSDUOnBehalfOf = null)

Query the index using cursor and optionally return only requested fields.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data. It can be used to retrieve large numbers of results (or even all results) from a single search request, in much the same way as you would use a cursor on a traditional database.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class QueryWithCursorExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SearchApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
            var body = new SearchCursorQueryRequest(); // SearchCursorQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional) 

            try
            {
                // Query the index using cursor and optionally return only requested fields.
                SearchCursorQueryResponse result = apiInstance.QueryWithCursor(oSDUAccountId, body, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SearchApi.QueryWithCursor: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **body** | [**SearchCursorQueryRequest**](SearchCursorQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. | 
 **oSDUOnBehalfOf** | **string**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

[**SearchCursorQueryResponse**](SearchCursorQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

