# OsduClient.DeliveryAPIApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**returns_delivery_instructions_for_file_s_using_sr_ns**](DeliveryAPIApi.md#returns_delivery_instructions_for_file_s_using_sr_ns) | **POST** /api/file/v2/delivery/getFileSignedUrl | 


# **returns_delivery_instructions_for_file_s_using_sr_ns**
> FileDeliveryGetFileSignedURLResponse returns_delivery_instructions_for_file_s_using_sr_ns(data_partition_id, body=body)



Returns delivery instructions for File(s) using SRNs

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
api_instance = OsduClient.DeliveryAPIApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
body = OsduClient.FileDeliveryGetFileSignedURLRequest() # FileDeliveryGetFileSignedURLRequest |  (optional)

try:
    api_response = api_instance.returns_delivery_instructions_for_file_s_using_sr_ns(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DeliveryAPIApi->returns_delivery_instructions_for_file_s_using_sr_ns: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileDeliveryGetFileSignedURLRequest**](FileDeliveryGetFileSignedURLRequest.md)|  | [optional] 

### Return type

[**FileDeliveryGetFileSignedURLResponse**](FileDeliveryGetFileSignedURLResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

