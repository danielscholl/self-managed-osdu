# OsduClient.SchemaApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_schema**](SchemaApi.md#create_schema) | **POST** /api/schema-service/v1/schema | Adds a schema to the schema repository.
[**get_schema**](SchemaApi.md#get_schema) | **GET** /api/schema-service/v1/schema/{id} | Gets schema from the schema repository.
[**search_schema_info_repository**](SchemaApi.md#search_schema_info_repository) | **GET** /api/schema-service/v1/schema | Searches schemaInfo repository
[**update_schema**](SchemaApi.md#update_schema) | **PUT** /api/schema-service/v1/schema | Creates/Updates a schema in development status


# **create_schema**
> SchemaInfo create_schema(data_partition_id, body)

Adds a schema to the schema repository.

Adds a schema to the schema repository. The schemaIdentity must be unique. The `authority`, `source` and `entityType` will be registered if not present. If lower minor versions are registered the service validates the new schema against breaking changes; if breaking changes are discovered the request fails. **Note:** The schema must not reference other schemas with status `DEVELOPMENT`. Scope to a schema will be set by system based on partition id (`SHARED` for common tenant and `INTERNAL` for private tenant). Required roles 'users.datalake.editors' or 'users.datalake.admins' groups to create schema.

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
api_instance = OsduClient.SchemaApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
body = OsduClient.SchemaRequest() # SchemaRequest | 

try:
    # Adds a schema to the schema repository.
    api_response = api_instance.create_schema(data_partition_id, body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SchemaApi->create_schema: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **body** | [**SchemaRequest**](SchemaRequest.md)|  | 

### Return type

[**SchemaInfo**](SchemaInfo.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_schema**
> object get_schema(data_partition_id, id)

Gets schema from the schema repository.

Retrieve a schema using its system defined id. Required roles 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' groups to get the schema.

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
api_instance = OsduClient.SchemaApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
id = 'id_example' # str | the system id of the schema

try:
    # Gets schema from the schema repository.
    api_response = api_instance.get_schema(data_partition_id, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SchemaApi->get_schema: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **id** | **str**| the system id of the schema | 

### Return type

**object**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_schema_info_repository**
> SchemaInfoResponse search_schema_info_repository(data_partition_id, authority=authority, source=source, entity_type=entity_type, schema_version_major=schema_version_major, schema_version_minor=schema_version_minor, status=status, scope=scope, latest_version=latest_version, limit=limit, offset=offset)

Searches schemaInfo repository

Searches for information of available schema (SchemInfo) in schema repository. Supports options to filter out the search contents. Required roles 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' groups to get the schema.

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
api_instance = OsduClient.SchemaApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
authority = '*' # str | pass an optional string to search for a specific authority (optional) (default to *)
source = '*' # str | pass an optional string to search for a specific source (optional) (default to *)
entity_type = '*' # str | pass an optional string to search for a specific entityType (optional) (default to *)
schema_version_major = '*' # str | pass an optional string to search for a specific schemaVersionMajor (optional) (default to *)
schema_version_minor = '*' # str | pass an optional string to search for a specific schemaVersionMinor (optional) (default to *)
status = 'PUBLISHED' # str | The schema status specification (optional) (default to PUBLISHED)
scope = 'INTERNAL' # str | The scope or schema visibility specification (optional) (default to INTERNAL)
latest_version = false # bool | if True, only return the latest version (optional) (default to false)
limit = 56 # int | maximum number of schema records to return (optional)
offset = 56 # int | number of records to skip for pagination (optional)

try:
    # Searches schemaInfo repository
    api_response = api_instance.search_schema_info_repository(data_partition_id, authority=authority, source=source, entity_type=entity_type, schema_version_major=schema_version_major, schema_version_minor=schema_version_minor, status=status, scope=scope, latest_version=latest_version, limit=limit, offset=offset)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SchemaApi->search_schema_info_repository: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **authority** | **str**| pass an optional string to search for a specific authority | [optional] [default to *]
 **source** | **str**| pass an optional string to search for a specific source | [optional] [default to *]
 **entity_type** | **str**| pass an optional string to search for a specific entityType | [optional] [default to *]
 **schema_version_major** | **str**| pass an optional string to search for a specific schemaVersionMajor | [optional] [default to *]
 **schema_version_minor** | **str**| pass an optional string to search for a specific schemaVersionMinor | [optional] [default to *]
 **status** | **str**| The schema status specification | [optional] [default to PUBLISHED]
 **scope** | **str**| The scope or schema visibility specification | [optional] [default to INTERNAL]
 **latest_version** | **bool**| if True, only return the latest version | [optional] [default to false]
 **limit** | **int**| maximum number of schema records to return | [optional] 
 **offset** | **int**| number of records to skip for pagination | [optional] 

### Return type

[**SchemaInfoResponse**](SchemaInfoResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_schema**
> SchemaInfo update_schema(data_partition_id, body)

Creates/Updates a schema in development status

Creates a new schema or updates an already existing schema with status `DEVELOPMENT` in the schema repository. If a user tries to create/update a schema with status other then `DEVELOPMENT`, API will throw an exception. Any schema instance with the same schemaIdentity is replaced (in contrast to the immutability of `PUBLISHED` or `OBSOLETE` schemas). A schema state can also be changed from `DEVELOPMENT` to `PUBLISHED` or `OBSOLETE` while updating schema content or by providing the same schema content. **Note:** The schema may refer to other schema definitions in `DEVELOPMENT` state. If those schemas are updated themselves, it is the developer's responsibility to PUT the dependent schemas again to update the schemas. Scope for a schema can't be updated, its a system defined value. Required roles  'users.datalake.editors' or 'users.datalake.admins' groups to update schema.

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
api_instance = OsduClient.SchemaApi(OsduClient.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
body = OsduClient.SchemaRequest() # SchemaRequest | SchemaRequest

try:
    # Creates/Updates a schema in development status
    api_response = api_instance.update_schema(data_partition_id, body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SchemaApi->update_schema: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **body** | [**SchemaRequest**](SchemaRequest.md)| SchemaRequest | 

### Return type

[**SchemaInfo**](SchemaInfo.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

