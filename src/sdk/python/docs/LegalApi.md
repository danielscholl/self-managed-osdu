# OsduClient.LegalApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_legal_tag**](LegalApi.md#create_legal_tag) | **POST** /api/legal/v1/legaltags | Creates the LegalTag for the given &#39;name&#39;.
[**delete_legal_tag**](LegalApi.md#delete_legal_tag) | **DELETE** /api/legal/v1/legaltags/{name} | Delete Legal Tag
[**get_legal_tag**](LegalApi.md#get_legal_tag) | **GET** /api/legal/v1/legaltags/{name} | Gets a LegalTag for the given &#39;name&#39;.
[**get_legal_tag_properties**](LegalApi.md#get_legal_tag_properties) | **GET** /api/legal/v1/legaltags:properties | Gets LegalTag property values.
[**get_legal_tags**](LegalApi.md#get_legal_tags) | **POST** /api/legal/v1/legaltags:batchRetrieve | Retrieves the LegalTags for the given names.
[**list_legal_tags**](LegalApi.md#list_legal_tags) | **GET** /api/legal/v1/legaltags | Gets all LegalTags.
[**update_legal_tag**](LegalApi.md#update_legal_tag) | **PUT** /api/legal/v1/legaltags | Updates the LegalTag for the given &#39;name&#39;.
[**validate_legal_tags**](LegalApi.md#validate_legal_tags) | **POST** /api/legal/v1/legaltags:validate | Retrieves the invalid LegalTag names with reasons for the given names.


# **create_legal_tag**
> LegalTagDto create_legal_tag(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)

Creates the LegalTag for the given 'name'.

This allows for the creation of your LegalTag. There can only be 1 LegalTag per 'name'. A LegalTag must be created before you can start ingesting data for that name.

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Users account e.g. OSDU
body = OsduClient.LegalTagDto() # LegalTagDto |  (optional)
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | User's email or auth token (optional)

try:
    # Creates the LegalTag for the given 'name'.
    api_response = api_instance.create_legal_tag(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling LegalApi->create_legal_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Users account e.g. OSDU | 
 **body** | [**LegalTagDto**](LegalTagDto.md)|  | [optional] 
 **osdu_on_behalf_of** | **str**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_legal_tag**
> delete_legal_tag(data_partition_id, name)

Delete Legal Tag

This allows for the deletion of your LegalTag using the 'name' associated with it. 

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Partition Id
name = 'name_example' # str | 

try:
    # Delete Legal Tag
    api_instance.delete_legal_tag(data_partition_id, name)
except ApiException as e:
    print("Exception when calling LegalApi->delete_legal_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Partition Id | 
 **name** | **str**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_legal_tag**
> LegalTagDto get_legal_tag(data_partition_id, name)

Gets a LegalTag for the given 'name'.

This allows for the retrieval of your LegalTag using the 'name' associated with it.

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Partition Id
name = 'name_example' # str | 

try:
    # Gets a LegalTag for the given 'name'.
    api_response = api_instance.get_legal_tag(data_partition_id, name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling LegalApi->get_legal_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Partition Id | 
 **name** | **str**|  | 

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_legal_tag_properties**
> LegalTagPropertyValues get_legal_tag_properties(data_partition_id)

Gets LegalTag property values.

This allows for the retrieval of allowed values for LegalTag properties.

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Partition Id

try:
    # Gets LegalTag property values.
    api_response = api_instance.get_legal_tag_properties(data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling LegalApi->get_legal_tag_properties: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Partition Id | 

### Return type

[**LegalTagPropertyValues**](LegalTagPropertyValues.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_legal_tags**
> LegalTagDtos get_legal_tags(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)

Retrieves the LegalTags for the given names.

This allows for the retrieval of your LegalTags using the 'name' associated with it. A maximum of 25 can be retrieved at once.

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Users account e.g. OSDU
body = OsduClient.LegalTagRequest() # LegalTagRequest |  (optional)
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | User's email or auth token (optional)

try:
    # Retrieves the LegalTags for the given names.
    api_response = api_instance.get_legal_tags(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling LegalApi->get_legal_tags: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Users account e.g. OSDU | 
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional] 
 **osdu_on_behalf_of** | **str**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_legal_tags**
> LegalTagDtos list_legal_tags(osdu_account_id, valid=valid, osdu_on_behalf_of=osdu_on_behalf_of)

Gets all LegalTags.

This allows for the retrieval of all LegalTags.

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Users account e.g. OSDU
valid = true # bool | If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true. (optional) (default to true)
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | User's email or auth token (optional)

try:
    # Gets all LegalTags.
    api_response = api_instance.list_legal_tags(osdu_account_id, valid=valid, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling LegalApi->list_legal_tags: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Users account e.g. OSDU | 
 **valid** | **bool**| If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true. | [optional] [default to true]
 **osdu_on_behalf_of** | **str**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_legal_tag**
> LegalTagDto update_legal_tag(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)

Updates the LegalTag for the given 'name'.

This allows to update certain properties of your LegalTag using the 'name' associated with it.

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Users account e.g. OSDU
body = OsduClient.LegalTagUpdateDto() # LegalTagUpdateDto |  (optional)
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | User's email or auth token (optional)

try:
    # Updates the LegalTag for the given 'name'.
    api_response = api_instance.update_legal_tag(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling LegalApi->update_legal_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Users account e.g. OSDU | 
 **body** | [**LegalTagUpdateDto**](LegalTagUpdateDto.md)|  | [optional] 
 **osdu_on_behalf_of** | **str**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validate_legal_tags**
> LegalTagInvalidResponseList validate_legal_tags(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)

Retrieves the invalid LegalTag names with reasons for the given names.

This allows for the retrieval of the reason why your LegalTag is not valid. A maximum of 25 can be retrieved at once.

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
api_instance = OsduClient.LegalApi(OsduClient.ApiClient(configuration))
osdu_account_id = 'osdu_account_id_example' # str | Users account e.g. OSDU
body = OsduClient.LegalTagRequest() # LegalTagRequest |  (optional)
osdu_on_behalf_of = 'osdu_on_behalf_of_example' # str | User's email or auth token (optional)

try:
    # Retrieves the invalid LegalTag names with reasons for the given names.
    api_response = api_instance.validate_legal_tags(osdu_account_id, body=body, osdu_on_behalf_of=osdu_on_behalf_of)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling LegalApi->validate_legal_tags: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Users account e.g. OSDU | 
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional] 
 **osdu_on_behalf_of** | **str**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagInvalidResponseList**](LegalTagInvalidResponseList.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

