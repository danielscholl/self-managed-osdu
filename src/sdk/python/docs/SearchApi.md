# OsduClient.SearchApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_index**](SearchApi.md#delete_index) | **DELETE** /api/search/v2/index/{kind} | Deletes all documents from index for given &#39;kind&#39;.
[**get_kind_schema**](SearchApi.md#get_kind_schema) | **GET** /api/search/v2/index/schema/{kind} | Returns the index schema for given &#39;kind&#39;.
[**query_records**](SearchApi.md#query_records) | **POST** /api/search/v2/query | Queries the index for the specified kind using the input query string.
[**query_with_cursor**](SearchApi.md#query_with_cursor) | **POST** /api/search/v2/query_with_cursor | Query the index using cursor and optionally return only requested fields.


# **delete_index**
> delete_index(osdu_account_id, kind, osdu_on_behalf_of=osdu_on_behalf_of)

Deletes all documents from index for given 'kind'.

The API can be used  to purge all indexed documents for a kind. Required access level to use this API is service.search.admin

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.SearchApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
kind = 'kind_example' # str | Kind of the record.
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional)

try:
    # Deletes all documents from index for given 'kind'.
    api_instance.delete_index(osdu_account_id, kind, osdu_on_behalf_of=osdu_on_behalf_of)
except ApiException as e:
    print("Exception when calling SearchApi->delete_index: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **kind** | **str**| Kind of the record. | 
 **osdu_on_behalf_of** | **str**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_kind_schema**
> str get_kind_schema(osdu_account_id, kind, osdu_on_behalf_of=osdu_on_behalf_of)

Returns the index schema for given 'kind'.

The API returns the schema for a given kind which is used find what attributes are indexed and their respective data types (at index time). Required access levels to use this API are service.search.user, service.search.admin

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.SearchApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
kind = 'kind_example' # str | Kind of the record.
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional)

try:
    # Returns the index schema for given 'kind'.
    api_response = api_instance.get_kind_schema(osdu_account_id, kind, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SearchApi->get_kind_schema: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **kind** | **str**| Kind of the record. | 
 **osdu_on_behalf_of** | **str**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

**str**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **query_records**
> SearchQueryResponse query_records(osdu_account_id, body, osdu_on_behalf_of=osdu_on_behalf_of)

Queries the index for the specified kind using the input query string.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.SearchApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
body = OsduClient.SearchQueryRequest() # SearchQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional)

try:
    # Queries the index for the specified kind using the input query string.
    api_response = api_instance.query_records(osdu_account_id, body, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SearchApi->query_records: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **body** | [**SearchQueryRequest**](SearchQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. | 
 **osdu_on_behalf_of** | **str**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

[**SearchQueryResponse**](SearchQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **query_with_cursor**
> SearchCursorQueryResponse query_with_cursor(osdu_account_id, body, osdu_on_behalf_of=osdu_on_behalf_of)

Query the index using cursor and optionally return only requested fields.

The API supports full text search on string fields, range queries on date, numeric or string fields, along with geo-spatial search. Required access levels to use this API are service.search.user, service.search.admin. In addition, users must be a member of data groups to access the data. It can be used to retrieve large numbers of results (or even all results) from a single search request, in much the same way as you would use a cursor on a traditional database.

### Example
```python
from __future__ import print_function
import time
import OsduClient
from OsduClient.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = OsduClient.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = OsduClient.SearchApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API.
body = OsduClient.SearchCursorQueryRequest() # SearchCursorQueryRequest | Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly.
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. (optional)

try:
    # Query the index using cursor and optionally return only requested fields.
    api_response = api_instance.query_with_cursor(osdu_account_id, body, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SearchApi->query_with_cursor: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | 
 **body** | [**SearchCursorQueryRequest**](SearchCursorQueryRequest.md)| Specifies the API parameters. The only required parameter is the kind which needs to be formatted correctly. | 
 **osdu_on_behalf_of** | **str**| On behalf email or token is the token/email of the original user making the call. For now, only email is supported but eventually, primary usage will be token. | [optional] 

### Return type

[**SearchCursorQueryResponse**](SearchCursorQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

