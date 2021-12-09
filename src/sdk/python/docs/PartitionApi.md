# swagger_client.PartitionApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_using_post**](PartitionApi.md#create_using_post) | **POST** /api/partition/v1/partitions/{partitionId} | Create Partition
[**delete_using_delete**](PartitionApi.md#delete_using_delete) | **DELETE** /api/partition/v1/partitions/{partitionId} | Delete Partition
[**get_using_get**](PartitionApi.md#get_using_get) | **GET** /api/partition/v1/partitions/{partitionId} | Get Single Partition
[**list_using_get**](PartitionApi.md#list_using_get) | **GET** /api/partition/v1/partitions | List Partitions
[**update_using_patch**](PartitionApi.md#update_using_patch) | **PATCH** /api/partition/v1/partitions/{partitionId} | Update Partition


# **create_using_post**
> create_using_post(partition_id, partition_info)

Create Partition

By passing in a partition Id and a partition info object you can create a partition. 

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
api_instance = swagger_client.PartitionApi(swagger_client.ApiClient(configuration))
partition_id = 'partition_id_example' # str | partitionId
partition_info = swagger_client.PartitionDto() # PartitionDto | partitionInfo

try:
    # Create Partition
    api_instance.create_using_post(partition_id, partition_info)
except ApiException as e:
    print("Exception when calling PartitionApi->create_using_post: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partition_id** | **str**| partitionId | 
 **partition_info** | [**PartitionDto**](PartitionDto.md)| partitionInfo | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_using_delete**
> delete_using_delete(partition_id)

Delete Partition

By passing in a single partition Id, you can delete a partition. 

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
api_instance = swagger_client.PartitionApi(swagger_client.ApiClient(configuration))
partition_id = 'partition_id_example' # str | partitionId

try:
    # Delete Partition
    api_instance.delete_using_delete(partition_id)
except ApiException as e:
    print("Exception when calling PartitionApi->delete_using_delete: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partition_id** | **str**| partitionId | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_using_get**
> dict(str, PartitionProperty) get_using_get(partition_id)

Get Single Partition

By passing in a partition Id, you can retrieve the partition information. 

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
api_instance = swagger_client.PartitionApi(swagger_client.ApiClient(configuration))
partition_id = 'partition_id_example' # str | partitionId

try:
    # Get Single Partition
    api_response = api_instance.get_using_get(partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling PartitionApi->get_using_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partition_id** | **str**| partitionId | 

### Return type

[**dict(str, PartitionProperty)**](PartitionProperty.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_using_get**
> list[str] list_using_get()

List Partitions

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
api_instance = swagger_client.PartitionApi(swagger_client.ApiClient(configuration))

try:
    # List Partitions
    api_response = api_instance.list_using_get()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling PartitionApi->list_using_get: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

**list[str]**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_using_patch**
> update_using_patch(partition_id, partition_info)

Update Partition

By passing in a partition Id and a partition info object you can update a partition. 

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
api_instance = swagger_client.PartitionApi(swagger_client.ApiClient(configuration))
partition_id = 'partition_id_example' # str | partitionId
partition_info = swagger_client.PartitionDto() # PartitionDto | partitionInfo

try:
    # Update Partition
    api_instance.update_using_patch(partition_id, partition_info)
except ApiException as e:
    print("Exception when calling PartitionApi->update_using_patch: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partition_id** | **str**| partitionId | 
 **partition_info** | [**PartitionDto**](PartitionDto.md)| partitionInfo | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

