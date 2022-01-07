# OsduClient.Api.SchemaApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**CreateSchema**](SchemaApi.md#createschema) | **POST** /api/schema-service/v1/schema | Adds a schema to the schema repository.
[**GetSchema**](SchemaApi.md#getschema) | **GET** /api/schema-service/v1/schema/{id} | Gets schema from the schema repository.
[**SearchSchemaInfoRepository**](SchemaApi.md#searchschemainforepository) | **GET** /api/schema-service/v1/schema | Searches schemaInfo repository
[**UpdateSchema**](SchemaApi.md#updateschema) | **PUT** /api/schema-service/v1/schema | Creates/Updates a schema in development status


<a name="createschema"></a>
# **CreateSchema**
> SchemaInfo CreateSchema (string dataPartitionId, SchemaRequest body)

Adds a schema to the schema repository.

Adds a schema to the schema repository. The schemaIdentity must be unique. The `authority`, `source` and `entityType` will be registered if not present. If lower minor versions are registered the service validates the new schema against breaking changes; if breaking changes are discovered the request fails. **Note:** The schema must not reference other schemas with status `DEVELOPMENT`. Scope to a schema will be set by system based on partition id (`SHARED` for common tenant and `INTERNAL` for private tenant). Required roles 'users.datalake.editors' or 'users.datalake.admins' groups to create schema.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class CreateSchemaExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SchemaApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
            var body = new SchemaRequest(); // SchemaRequest | 

            try
            {
                // Adds a schema to the schema repository.
                SchemaInfo result = apiInstance.CreateSchema(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SchemaApi.CreateSchema: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **body** | [**SchemaRequest**](SchemaRequest.md)|  | 

### Return type

[**SchemaInfo**](SchemaInfo.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getschema"></a>
# **GetSchema**
> Object GetSchema (string dataPartitionId, string id)

Gets schema from the schema repository.

Retrieve a schema using its system defined id. Required roles 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' groups to get the schema.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetSchemaExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SchemaApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
            var id = id_example;  // string | the system id of the schema

            try
            {
                // Gets schema from the schema repository.
                Object result = apiInstance.GetSchema(dataPartitionId, id);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SchemaApi.GetSchema: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **id** | **string**| the system id of the schema | 

### Return type

**Object**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="searchschemainforepository"></a>
# **SearchSchemaInfoRepository**
> SchemaInfoResponse SearchSchemaInfoRepository (string dataPartitionId, string authority = null, string source = null, string entityType = null, string schemaVersionMajor = null, string schemaVersionMinor = null, string status = null, string scope = null, bool? latestVersion = null, int? limit = null, int? offset = null)

Searches schemaInfo repository

Searches for information of available schema (SchemInfo) in schema repository. Supports options to filter out the search contents. Required roles 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' groups to get the schema.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class SearchSchemaInfoRepositoryExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SchemaApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
            var authority = authority_example;  // string | pass an optional string to search for a specific authority (optional)  (default to *)
            var source = source_example;  // string | pass an optional string to search for a specific source (optional)  (default to *)
            var entityType = entityType_example;  // string | pass an optional string to search for a specific entityType (optional)  (default to *)
            var schemaVersionMajor = schemaVersionMajor_example;  // string | pass an optional string to search for a specific schemaVersionMajor (optional)  (default to *)
            var schemaVersionMinor = schemaVersionMinor_example;  // string | pass an optional string to search for a specific schemaVersionMinor (optional)  (default to *)
            var status = status_example;  // string | The schema status specification (optional)  (default to PUBLISHED)
            var scope = scope_example;  // string | The scope or schema visibility specification (optional)  (default to INTERNAL)
            var latestVersion = true;  // bool? | if True, only return the latest version (optional)  (default to false)
            var limit = 56;  // int? | maximum number of schema records to return (optional) 
            var offset = 56;  // int? | number of records to skip for pagination (optional) 

            try
            {
                // Searches schemaInfo repository
                SchemaInfoResponse result = apiInstance.SearchSchemaInfoRepository(dataPartitionId, authority, source, entityType, schemaVersionMajor, schemaVersionMinor, status, scope, latestVersion, limit, offset);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SchemaApi.SearchSchemaInfoRepository: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **authority** | **string**| pass an optional string to search for a specific authority | [optional] [default to *]
 **source** | **string**| pass an optional string to search for a specific source | [optional] [default to *]
 **entityType** | **string**| pass an optional string to search for a specific entityType | [optional] [default to *]
 **schemaVersionMajor** | **string**| pass an optional string to search for a specific schemaVersionMajor | [optional] [default to *]
 **schemaVersionMinor** | **string**| pass an optional string to search for a specific schemaVersionMinor | [optional] [default to *]
 **status** | **string**| The schema status specification | [optional] [default to PUBLISHED]
 **scope** | **string**| The scope or schema visibility specification | [optional] [default to INTERNAL]
 **latestVersion** | **bool?**| if True, only return the latest version | [optional] [default to false]
 **limit** | **int?**| maximum number of schema records to return | [optional] 
 **offset** | **int?**| number of records to skip for pagination | [optional] 

### Return type

[**SchemaInfoResponse**](SchemaInfoResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="updateschema"></a>
# **UpdateSchema**
> SchemaInfo UpdateSchema (string dataPartitionId, SchemaRequest body)

Creates/Updates a schema in development status

Creates a new schema or updates an already existing schema with status `DEVELOPMENT` in the schema repository. If a user tries to create/update a schema with status other then `DEVELOPMENT`, API will throw an exception. Any schema instance with the same schemaIdentity is replaced (in contrast to the immutability of `PUBLISHED` or `OBSOLETE` schemas). A schema state can also be changed from `DEVELOPMENT` to `PUBLISHED` or `OBSOLETE` while updating schema content or by providing the same schema content. **Note:** The schema may refer to other schema definitions in `DEVELOPMENT` state. If those schemas are updated themselves, it is the developer's responsibility to PUT the dependent schemas again to update the schemas. Scope for a schema can't be updated, its a system defined value. Required roles  'users.datalake.editors' or 'users.datalake.admins' groups to update schema.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class UpdateSchemaExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new SchemaApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition.
            var body = new SchemaRequest(); // SchemaRequest | SchemaRequest

            try
            {
                // Creates/Updates a schema in development status
                SchemaInfo result = apiInstance.UpdateSchema(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling SchemaApi.UpdateSchema: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should be either the partition name or crm account ID associated with the partition. | 
 **body** | [**SchemaRequest**](SchemaRequest.md)| SchemaRequest | 

### Return type

[**SchemaInfo**](SchemaInfo.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

