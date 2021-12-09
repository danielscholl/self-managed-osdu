# swagger_client.EntitlementApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_member_using_post**](EntitlementApi.md#add_member_using_post) | **POST** /api/entitlements/v2/groups/{group_email}/members | Add Member to Group
[**create_group_using_post**](EntitlementApi.md#create_group_using_post) | **POST** /api/entitlements/v2/groups | Create a Group
[**delete_group_using_delete**](EntitlementApi.md#delete_group_using_delete) | **DELETE** /api/entitlements/v2/groups/{group_email} | Delete a Group
[**delete_member_using_delete**](EntitlementApi.md#delete_member_using_delete) | **DELETE** /api/entitlements/v2/members/{member_email} | Delete a User
[**delete_member_using_delete1**](EntitlementApi.md#delete_member_using_delete1) | **DELETE** /api/entitlements/v2/groups/{group_email}/members/{member_email} | Remove Member from Group
[**list_group_members_using_get**](EntitlementApi.md#list_group_members_using_get) | **GET** /api/entitlements/v2/groups/{group_email}/members | List Group Members
[**list_groups_on_behalf_of_using_get**](EntitlementApi.md#list_groups_on_behalf_of_using_get) | **GET** /api/entitlements/v2/members/{member_email}/groups | List Assigned Groups for User
[**list_groups_using_get**](EntitlementApi.md#list_groups_using_get) | **GET** /api/entitlements/v2/groups | List Assigned Groups
[**update_group_using_patch**](EntitlementApi.md#update_group_using_patch) | **PATCH** /api/entitlements/v2/groups/{group_email} | Updates Items in Group


# **add_member_using_post**
> EntitlementMemberDto add_member_using_post(data_partition_id, group_email, partition_info)

Add Member to Group

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Partition Name
group_email = 'group_email_example' # str | group_email
partition_info = swagger_client.EntitlementMemberDto() # EntitlementMemberDto | partitionInfo

try:
    # Add Member to Group
    api_response = api_instance.add_member_using_post(data_partition_id, group_email, partition_info)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling EntitlementApi->add_member_using_post: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Partition Name | 
 **group_email** | **str**| group_email | 
 **partition_info** | [**EntitlementMemberDto**](EntitlementMemberDto.md)| partitionInfo | 

### Return type

[**EntitlementMemberDto**](EntitlementMemberDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_group_using_post**
> create_group_using_post(data_partition_id)

Create a Group

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Partition Id

try:
    # Create a Group
    api_instance.create_group_using_post(data_partition_id)
except ApiException as e:
    print("Exception when calling EntitlementApi->create_group_using_post: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Partition Id | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_group_using_delete**
> delete_group_using_delete(data_partition_id, group_email)

Delete a Group

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | tenant
group_email = 'group_email_example' # str | group_email

try:
    # Delete a Group
    api_instance.delete_group_using_delete(data_partition_id, group_email)
except ApiException as e:
    print("Exception when calling EntitlementApi->delete_group_using_delete: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| tenant | 
 **group_email** | **str**| group_email | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_member_using_delete**
> delete_member_using_delete(data_partition_id, member_email)

Delete a User

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Data Partition Id
member_email = 'member_email_example' # str | member_email

try:
    # Delete a User
    api_instance.delete_member_using_delete(data_partition_id, member_email)
except ApiException as e:
    print("Exception when calling EntitlementApi->delete_member_using_delete: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Data Partition Id | 
 **member_email** | **str**| member_email | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_member_using_delete1**
> str delete_member_using_delete1(data_partition_id, group_email, member_email)

Remove Member from Group

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Data Partition Id
group_email = 'group_email_example' # str | group_email
member_email = 'member_email_example' # str | member_email

try:
    # Remove Member from Group
    api_response = api_instance.delete_member_using_delete1(data_partition_id, group_email, member_email)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling EntitlementApi->delete_member_using_delete1: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Data Partition Id | 
 **group_email** | **str**| group_email | 
 **member_email** | **str**| member_email | 

### Return type

**str**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_group_members_using_get**
> list_group_members_using_get(data_partition_id, group_email, role=role, include_type=include_type)

List Group Members

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Data Partition Id
group_email = 'group_email_example' # str | group_email
role = 'role_example' # str | role (optional)
include_type = true # bool | includeType (optional)

try:
    # List Group Members
    api_instance.list_group_members_using_get(data_partition_id, group_email, role=role, include_type=include_type)
except ApiException as e:
    print("Exception when calling EntitlementApi->list_group_members_using_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Data Partition Id | 
 **group_email** | **str**| group_email | 
 **role** | **str**| role | [optional] 
 **include_type** | **bool**| includeType | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_groups_on_behalf_of_using_get**
> list_groups_on_behalf_of_using_get(data_partition_id, member_email, type=type, appid=appid)

List Assigned Groups for User

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | tenant
member_email = 'member_email_example' # str | member_email
type = 'type_example' # str | type (optional)
appid = 'appid_example' # str | appid (optional)

try:
    # List Assigned Groups for User
    api_instance.list_groups_on_behalf_of_using_get(data_partition_id, member_email, type=type, appid=appid)
except ApiException as e:
    print("Exception when calling EntitlementApi->list_groups_on_behalf_of_using_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| tenant | 
 **member_email** | **str**| member_email | 
 **type** | **str**| type | [optional] 
 **appid** | **str**| appid | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_groups_using_get**
> EntitlementGroupResponse list_groups_using_get(data_partition_id)

List Assigned Groups

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | tenant

try:
    # List Assigned Groups
    api_response = api_instance.list_groups_using_get(data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling EntitlementApi->list_groups_using_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| tenant | 

### Return type

[**EntitlementGroupResponse**](EntitlementGroupResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_group_using_patch**
> update_group_using_patch(data_partition_id, group_email)

Updates Items in Group

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.EntitlementApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | tenant
group_email = 'group_email_example' # str | group_email

try:
    # Updates Items in Group
    api_instance.update_group_using_patch(data_partition_id, group_email)
except ApiException as e:
    print("Exception when calling EntitlementApi->update_group_using_patch: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| tenant | 
 **group_email** | **str**| group_email | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

