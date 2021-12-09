# swagger_client.StorageApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_or_update_records**](StorageApi.md#create_or_update_records) | **PUT** /api/storage/v2/records | Create or update records
[**delete_record**](StorageApi.md#delete_record) | **POST** /api/records/{id}:delete | Delete record
[**delete_records**](StorageApi.md#delete_records) | **POST** /api/storage/v2/records/delete | Soft delete of multiple records
[**fetch_records**](StorageApi.md#fetch_records) | **POST** /api/storage/v2/query/records | Fetch records
[**get_all_kinds**](StorageApi.md#get_all_kinds) | **GET** /api/storage/v2/query/kinds | Get all kinds
[**get_all_record_from_kind**](StorageApi.md#get_all_record_from_kind) | **GET** /api/storage/v2/query/records | Get all record from kind
[**get_all_record_versions**](StorageApi.md#get_all_record_versions) | **GET** /api/storage/v2/records/versions/{id} | Get all record versions
[**get_record**](StorageApi.md#get_record) | **GET** /api/storage/v2/records/{id} | Get record
[**get_record_version**](StorageApi.md#get_record_version) | **GET** /api/storage/v2/records/{id}/{version} | Get record version
[**patch_update_records**](StorageApi.md#patch_update_records) | **PATCH** /api/storage/v2/records | Modify record metadata attributes using patch operations
[**purge_record**](StorageApi.md#purge_record) | **DELETE** /api/storage/v2/records/{id} | Purge record


# **create_or_update_records**
> StorageRecord create_or_update_records(osdu_account_id, skipdupes=skipdupes, body=body)

Create or update records

The API represents the main injection mechanism into the Data Lake. It allows records creation and/or update. When no record id is provided or when the provided id is not already present in the Data Lake then a new record is created. If the id is related to an existing record in the Data Lake then an update operation takes place and a new version of the record is created. Allowed roles: service.storage.creator and service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
skipdupes = true # bool | Skip duplicates when updating records with the same value. (optional) (default to true)
body = [swagger_client.StorageRecord()] # list[StorageRecord] |  (optional)

try:
    # Create or update records
    api_response = api_instance.create_or_update_records(osdu_account_id, skipdupes=skipdupes, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->create_or_update_records: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **skipdupes** | **bool**| Skip duplicates when updating records with the same value. | [optional] [default to true]
 **body** | [**list[StorageRecord]**](StorageRecord.md)|  | [optional] 

### Return type

[**StorageRecord**](StorageRecord.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_record**
> delete_record(id, osdu_account_id)

Delete record

The API performs a logical deletion of the given record. This operation can be reverted later. Allowed roles: service.storage.creator and service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | Record id
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)

try:
    # Delete record
    api_instance.delete_record(id, osdu_account_id)
except ApiException as e:
    print("Exception when calling StorageApi->delete_record: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| Record id | 
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_records**
> delete_records(data_partition_id, partition_info)

Soft delete of multiple records

The API performs a soft deletion of the given list of records. Required roles: 'users.datalake.editors' or 'users.datalake.admins'.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Partition Id
partition_info = [swagger_client.list[str]()] # list[str] | partitionInfo

try:
    # Soft delete of multiple records
    api_instance.delete_records(data_partition_id, partition_info)
except ApiException as e:
    print("Exception when calling StorageApi->delete_records: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Partition Id | 
 **partition_info** | **list[str]**| partitionInfo | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **fetch_records**
> StorageMultiRecordIds fetch_records(osdu_account_id, body=body)

Fetch records

The API fetches multiple records at once. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
body = swagger_client.StorageMultiRecordIds() # StorageMultiRecordIds |  (optional)

try:
    # Fetch records
    api_response = api_instance.fetch_records(osdu_account_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->fetch_records: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **body** | [**StorageMultiRecordIds**](StorageMultiRecordIds.md)|  | [optional] 

### Return type

[**StorageMultiRecordIds**](StorageMultiRecordIds.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_all_kinds**
> StorageQueryResponse get_all_kinds(osdu_account_id, cursor=cursor, limit=limit)

Get all kinds

The API returns a list of all kinds in the specific {Account-Id}. Allowed roles: service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
osdu_account_id = 'tenant1' # str | Account ID is the active account account) which the users choose to use with the Search API. (default to tenant1)
cursor = 'cursor_example' # str | Cursor (optional)
limit = 10 # int | Page Size (optional) (default to 10)

try:
    # Get all kinds
    api_response = api_instance.get_all_kinds(osdu_account_id, cursor=cursor, limit=limit)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->get_all_kinds: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active account account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **str**| Cursor | [optional] 
 **limit** | **int**| Page Size | [optional] [default to 10]

### Return type

[**StorageQueryResponse**](StorageQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_all_record_from_kind**
> StorageQueryResponse get_all_record_from_kind(osdu_account_id, cursor=cursor, limit=limit, kind=kind)

Get all record from kind

The API returns a list of all record ids which belong to the specified kind. Allowed roles: service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
cursor = 'cursor_example' # str | Cursor (optional)
limit = 10 # int | Page Size (optional) (default to 10)
kind = 'tenant1:public:well:1.0.2' # str | Filter Kind (optional) (default to tenant1:public:well:1.0.2)

try:
    # Get all record from kind
    api_response = api_instance.get_all_record_from_kind(osdu_account_id, cursor=cursor, limit=limit, kind=kind)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->get_all_record_from_kind: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **str**| Cursor | [optional] 
 **limit** | **int**| Page Size | [optional] [default to 10]
 **kind** | **str**| Filter Kind | [optional] [default to tenant1:public:well:1.0.2]

### Return type

[**StorageQueryResponse**](StorageQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_all_record_versions**
> StorageRecordVersions get_all_record_versions(id, osdu_account_id)

Get all record versions

The API returns a list containing all versions for the given record id. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | Record id
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)

try:
    # Get all record versions
    api_response = api_instance.get_all_record_versions(id, osdu_account_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->get_all_record_versions: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| Record id | 
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

[**StorageRecordVersions**](StorageRecordVersions.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_record**
> StorageRecordData get_record(id, osdu_account_id, attribute=attribute)

Get record

This API returns the latest version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | Record id
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
attribute = ['attribute_example'] # list[str] | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. (optional)

try:
    # Get record
    api_response = api_instance.get_record(id, osdu_account_id, attribute=attribute)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->get_record: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| Record id | 
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**list[str]**](str.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional] 

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_record_version**
> StorageRecordData get_record_version(id, version, osdu_account_id, attribute=attribute)

Get record version

The API retrieves the specific version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | Record id
version = 789 # int | Record version
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
attribute = ['attribute_example'] # list[str] | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. (optional)

try:
    # Get record version
    api_response = api_instance.get_record_version(id, version, osdu_account_id, attribute=attribute)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->get_record_version: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| Record id | 
 **version** | **int**| Record version | 
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**list[str]**](str.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional] 

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patch_update_records**
> StorageBulkUpdateRecordsResponse patch_update_records(osdu_account_id, body=body)

Modify record metadata attributes using patch operations

The API represents the patch update mechanism for records. It allows updating multiple records in one request. The currently supported operations are replace, add, and remove for Legal Tags, ACLs, and Tags.  Required roles: 'users.datalake.editors' or 'users.datalake.admins'.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
body = [swagger_client.StorageRecordBulkUpdateParam()] # list[StorageRecordBulkUpdateParam] |  (optional)

try:
    # Modify record metadata attributes using patch operations
    api_response = api_instance.patch_update_records(osdu_account_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling StorageApi->patch_update_records: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **body** | [**list[StorageRecordBulkUpdateParam]**](StorageRecordBulkUpdateParam.md)|  | [optional] 

### Return type

[**StorageBulkUpdateRecordsResponse**](StorageBulkUpdateRecordsResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **purge_record**
> purge_record(id, osdu_account_id)

Purge record

The API performs the physical deletion of the given record and all of its versions. This operation cannot be undone. Allowed roles: service.storage.admin.

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
api_instance = swagger_client.StorageApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | Record id
osdu_account_id = 'tenant1' # str | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)

try:
    # Purge record
    api_instance.purge_record(id, osdu_account_id)
except ApiException as e:
    print("Exception when calling StorageApi->purge_record: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| Record id | 
 **osdu_account_id** | **str**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

