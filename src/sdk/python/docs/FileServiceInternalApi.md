# swagger_client.FileServiceInternalApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**allows_the_application_to_audit_the_attempted_file_uploads__the_method_is_internal_and_is_not_available_for_third_party_applications_**](FileServiceInternalApi.md#allows_the_application_to_audit_the_attempted_file_uploads__the_method_is_internal_and_is_not_available_for_third_party_applications_) | **POST** /api/file/v2/getFileList | 
[**returns_file_location_and_driver_**](FileServiceInternalApi.md#returns_file_location_and_driver_) | **POST** /api/file/v2/getFileLocation | 


# **allows_the_application_to_audit_the_attempted_file_uploads__the_method_is_internal_and_is_not_available_for_third_party_applications_**
> FileListResponse allows_the_application_to_audit_the_attempted_file_uploads__the_method_is_internal_and_is_not_available_for_third_party_applications_(data_partition_id, body=body)



Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.

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
api_instance = swagger_client.FileServiceInternalApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
body = swagger_client.FileListRequest() # FileListRequest |  (optional)

try:
    api_response = api_instance.allows_the_application_to_audit_the_attempted_file_uploads__the_method_is_internal_and_is_not_available_for_third_party_applications_(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling FileServiceInternalApi->allows_the_application_to_audit_the_attempted_file_uploads__the_method_is_internal_and_is_not_available_for_third_party_applications_: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileListRequest**](FileListRequest.md)|  | [optional] 

### Return type

[**FileListResponse**](FileListResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **returns_file_location_and_driver_**
> FileLocationResponse returns_file_location_and_driver_(data_partition_id, body=body)



Returns file `Location` and `Driver`.

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
api_instance = swagger_client.FileServiceInternalApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
body = swagger_client.FileLocationRequest() # FileLocationRequest |  (optional)

try:
    api_response = api_instance.returns_file_location_and_driver_(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling FileServiceInternalApi->returns_file_location_and_driver_: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileLocationRequest**](FileLocationRequest.md)|  | [optional] 

### Return type

[**FileLocationResponse**](FileLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

