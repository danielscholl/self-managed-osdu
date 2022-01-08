# OsduClient.FileServiceApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deletes_metadata_record__file_for_the_given_id**](FileServiceApi.md#deletes_metadata_record__file_for_the_given_id) | **DELETE** /api/file/v2/files/{Id}/metadata | Deletes metadata record &amp; file assocaited with that record for the given id
[**get_a_location_in_landing_zone_to_upload_a_file_**](FileServiceApi.md#get_a_location_in_landing_zone_to_upload_a_file_) | **POST** /api/file/v2/getLocation | Get a location in Landing Zone to upload a file.
[**get_the_location_to_upload_a_file**](FileServiceApi.md#get_the_location_to_upload_a_file) | **GET** /api/file/v2/files/uploadURL | Get a location in Landing Zone to upload a file.
[**gets_metadata_record_for_the_given_id**](FileServiceApi.md#gets_metadata_record_for_the_given_id) | **GET** /api/file/v2/files/{Id}/metadata | Gets metadata record for the given id
[**gets_url_to_download_the_file_associated_with_the_given_id_**](FileServiceApi.md#gets_url_to_download_the_file_associated_with_the_given_id_) | **GET** /api/file/v2/files/{Id}/DownloadURL | Gets a URL to download the file
[**publish_file_metadata_for_a_file_**](FileServiceApi.md#publish_file_metadata_for_a_file_) | **POST** /api/file/v2/files/metadata | Creates metadata for a file


# **deletes_metadata_record__file_for_the_given_id**
> deletes_metadata_record__file_for_the_given_id(data_partition_id, id)

Deletes metadata record & file assocaited with that record for the given id

Deletes the File metadata record identified by the given id and file associated with that metadata record. **Required roles**: 'users.datalake.editors'  or 'users.datalake.admins'.

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
api_instance = OsduClient.FileServiceApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
id = 'id_example' # str | File metadata record Id.

try:
    # Deletes metadata record & file assocaited with that record for the given id
    api_instance.deletes_metadata_record__file_for_the_given_id(data_partition_id, id)
except ApiException as e:
    print("Exception when calling FileServiceApi->deletes_metadata_record__file_for_the_given_id: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **id** | **str**| File metadata record Id. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_a_location_in_landing_zone_to_upload_a_file_**
> FileLandingZoneLocationResponse get_a_location_in_landing_zone_to_upload_a_file_(data_partition_id, body=body)

Get a location in Landing Zone to upload a file.

Create a new location in the landing zone to upload a file. **Required roles**: 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'. 

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
api_instance = OsduClient.FileServiceApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
body = OsduClient.FileLocationRequest() # FileLocationRequest |  (optional)

try:
    # Get a location in Landing Zone to upload a file.
    api_response = api_instance.get_a_location_in_landing_zone_to_upload_a_file_(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling FileServiceApi->get_a_location_in_landing_zone_to_upload_a_file_: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileLocationRequest**](FileLocationRequest.md)|  | [optional] 

### Return type

[**FileLandingZoneLocationResponse**](FileLandingZoneLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_the_location_to_upload_a_file**
> FileSourceLocationResponse get_the_location_to_upload_a_file(data_partition_id)

Get a location in Landing Zone to upload a file.

Gets a temporary signed URL to upload a file.The generated URL is time bound and expires after 24 hours. User will receive a FileSource in the response.This is the relative path where the uploaded file will persist. Once the file is uploaded, FileSource can then be used to post metadata of the file. The uploaded file gets automatically deleted, if the metadata is not posted within 24 hours of uploading the file. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

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
api_instance = OsduClient.FileServiceApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

try:
    # Get a location in Landing Zone to upload a file.
    api_response = api_instance.get_the_location_to_upload_a_file(data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling FileServiceApi->get_the_location_to_upload_a_file: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 

### Return type

[**FileSourceLocationResponse**](FileSourceLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gets_metadata_record_for_the_given_id**
> FileRecordVersion gets_metadata_record_for_the_given_id(data_partition_id, id)

Gets metadata record for the given id

Gets the latest version of File metadata record identified by the given id. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

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
api_instance = OsduClient.FileServiceApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
id = 'id_example' # str | File metadata record Id.

try:
    # Gets metadata record for the given id
    api_response = api_instance.gets_metadata_record_for_the_given_id(data_partition_id, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling FileServiceApi->gets_metadata_record_for_the_given_id: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **id** | **str**| File metadata record Id. | 

### Return type

[**FileRecordVersion**](FileRecordVersion.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gets_url_to_download_the_file_associated_with_the_given_id_**
> FileDownloadResponse gets_url_to_download_the_file_associated_with_the_given_id_(data_partition_id, id, expiry_time=expiry_time)

Gets a URL to download the file

Gets a URL for downloading the file associated with the unique `id`. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

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
api_instance = OsduClient.FileServiceApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
id = 'id_example' # str | File Metadata record Id.
expiry_time = 'expiry_time_example' # str | The Time for which Signed URL to be valid. Accepted Regex patterns are \"^[0-9]+M$\", \"^[0-9]+H$\", \"^[0-9]+D$\" denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days. (optional)

try:
    # Gets a URL to download the file
    api_response = api_instance.gets_url_to_download_the_file_associated_with_the_given_id_(data_partition_id, id, expiry_time=expiry_time)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling FileServiceApi->gets_url_to_download_the_file_associated_with_the_given_id_: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **id** | **str**| File Metadata record Id. | 
 **expiry_time** | **str**| The Time for which Signed URL to be valid. Accepted Regex patterns are \&quot;^[0-9]+M$\&quot;, \&quot;^[0-9]+H$\&quot;, \&quot;^[0-9]+D$\&quot; denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days. | [optional] 

### Return type

[**FileDownloadResponse**](FileDownloadResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publish_file_metadata_for_a_file_**
> FileMetadataResponse publish_file_metadata_for_a_file_(data_partition_id, body=body)

Creates metadata for a file

This API creates a metadata record for a file that is already uploaded. The Metadata is linked to the file via `FileSource` provided in the request body. If `FileSource` attribute is missing in the request body or there is no file present, then the request fails with an error. When metadata is successfully updated in the system, it returns the `Id` of the file metadata record. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

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
api_instance = OsduClient.FileServiceApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
body = OsduClient.FileMetadata() # FileMetadata | File metadata content (optional)

try:
    # Creates metadata for a file
    api_response = api_instance.publish_file_metadata_for_a_file_(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling FileServiceApi->publish_file_metadata_for_a_file_: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileMetadata**](FileMetadata.md)| File metadata content | [optional] 

### Return type

[**FileMetadataResponse**](FileMetadataResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

