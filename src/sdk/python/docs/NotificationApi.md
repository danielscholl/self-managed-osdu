# swagger_client.NotificationApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**record_changed_using_post**](NotificationApi.md#record_changed_using_post) | **POST** /api/notification/v1/push-handlers/records-changed | Notifies subscribers that records have changed


# **record_changed_using_post**
> NotificationResponseEntity record_changed_using_post(data_partition_id)

Notifies subscribers that records have changed

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
api_instance = swagger_client.NotificationApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | tenant

try:
    # Notifies subscribers that records have changed
    api_response = api_instance.record_changed_using_post(data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling NotificationApi->record_changed_using_post: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| tenant | 

### Return type

[**NotificationResponseEntity**](NotificationResponseEntity.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

