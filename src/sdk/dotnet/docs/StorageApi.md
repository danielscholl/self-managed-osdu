# OsduClient.Api.StorageApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**CreateOrUpdateRecords**](StorageApi.md#createorupdaterecords) | **PUT** /api/storage/v2/records | Create or update records
[**DeleteRecord**](StorageApi.md#deleterecord) | **POST** /api/records/{id}:delete | Delete record
[**DeleteRecords**](StorageApi.md#deleterecords) | **POST** /api/storage/v2/records/delete | Soft delete of multiple records
[**FetchRecords**](StorageApi.md#fetchrecords) | **POST** /api/storage/v2/query/records | Fetch records
[**GetAllKinds**](StorageApi.md#getallkinds) | **GET** /api/storage/v2/query/kinds | Get all kinds
[**GetAllRecordFromKind**](StorageApi.md#getallrecordfromkind) | **GET** /api/storage/v2/query/records | Get all record from kind
[**GetAllRecordVersions**](StorageApi.md#getallrecordversions) | **GET** /api/storage/v2/records/versions/{id} | Get all record versions
[**GetRecord**](StorageApi.md#getrecord) | **GET** /api/storage/v2/records/{id} | Get record
[**GetRecordVersion**](StorageApi.md#getrecordversion) | **GET** /api/storage/v2/records/{id}/{version} | Get record version
[**PatchUpdateRecords**](StorageApi.md#patchupdaterecords) | **PATCH** /api/storage/v2/records | Modify record metadata attributes using patch operations
[**PurgeRecord**](StorageApi.md#purgerecord) | **DELETE** /api/storage/v2/records/{id} | Purge record


<a name="createorupdaterecords"></a>
# **CreateOrUpdateRecords**
> StorageRecord CreateOrUpdateRecords (string oSDUAccountId, bool? skipdupes = null, List<StorageRecord> body = null)

Create or update records

The API represents the main injection mechanism into the Data Lake. It allows records creation and/or update. When no record id is provided or when the provided id is not already present in the Data Lake then a new record is created. If the id is related to an existing record in the Data Lake then an update operation takes place and a new version of the record is created. Allowed roles: service.storage.creator and service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class CreateOrUpdateRecordsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
            var skipdupes = true;  // bool? | Skip duplicates when updating records with the same value. (optional)  (default to true)
            var body = new List<StorageRecord>(); // List<StorageRecord> |  (optional) 

            try
            {
                // Create or update records
                StorageRecord result = apiInstance.CreateOrUpdateRecords(oSDUAccountId, skipdupes, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.CreateOrUpdateRecords: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **skipdupes** | **bool?**| Skip duplicates when updating records with the same value. | [optional] [default to true]
 **body** | [**List&lt;StorageRecord&gt;**](StorageRecord.md)|  | [optional] 

### Return type

[**StorageRecord**](StorageRecord.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deleterecord"></a>
# **DeleteRecord**
> void DeleteRecord (string id, string oSDUAccountId)

Delete record

The API performs a logical deletion of the given record. This operation can be reverted later. Allowed roles: service.storage.creator and service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteRecordExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var id = id_example;  // string | Record id
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)

            try
            {
                // Delete record
                apiInstance.DeleteRecord(id, oSDUAccountId);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.DeleteRecord: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| Record id | 
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deleterecords"></a>
# **DeleteRecords**
> void DeleteRecords (string dataPartitionId, List<string> partitionInfo)

Soft delete of multiple records

The API performs a soft deletion of the given list of records. Required roles: 'users.datalake.editors' or 'users.datalake.admins'.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteRecordsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var dataPartitionId = dataPartitionId_example;  // string | Partition Id
            var partitionInfo = ;  // List<string> | partitionInfo

            try
            {
                // Soft delete of multiple records
                apiInstance.DeleteRecords(dataPartitionId, partitionInfo);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.DeleteRecords: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Partition Id | 
 **partitionInfo** | **List&lt;string&gt;**| partitionInfo | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="fetchrecords"></a>
# **FetchRecords**
> StorageMultiRecordIds FetchRecords (string oSDUAccountId, StorageMultiRecordIds body = null)

Fetch records

The API fetches multiple records at once. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class FetchRecordsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
            var body = new StorageMultiRecordIds(); // StorageMultiRecordIds |  (optional) 

            try
            {
                // Fetch records
                StorageMultiRecordIds result = apiInstance.FetchRecords(oSDUAccountId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.FetchRecords: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **body** | [**StorageMultiRecordIds**](StorageMultiRecordIds.md)|  | [optional] 

### Return type

[**StorageMultiRecordIds**](StorageMultiRecordIds.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getallkinds"></a>
# **GetAllKinds**
> StorageQueryResponse GetAllKinds (string oSDUAccountId, string cursor = null, int? limit = null)

Get all kinds

The API returns a list of all kinds in the specific {Account-Id}. Allowed roles: service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetAllKindsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active account account) which the users choose to use with the Search API. (default to tenant1)
            var cursor = cursor_example;  // string | Cursor (optional) 
            var limit = 56;  // int? | Page Size (optional)  (default to 10)

            try
            {
                // Get all kinds
                StorageQueryResponse result = apiInstance.GetAllKinds(oSDUAccountId, cursor, limit);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.GetAllKinds: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active account account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **string**| Cursor | [optional] 
 **limit** | **int?**| Page Size | [optional] [default to 10]

### Return type

[**StorageQueryResponse**](StorageQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getallrecordfromkind"></a>
# **GetAllRecordFromKind**
> StorageQueryResponse GetAllRecordFromKind (string oSDUAccountId, string cursor = null, int? limit = null, string kind = null)

Get all record from kind

The API returns a list of all record ids which belong to the specified kind. Allowed roles: service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetAllRecordFromKindExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
            var cursor = cursor_example;  // string | Cursor (optional) 
            var limit = 56;  // int? | Page Size (optional)  (default to 10)
            var kind = kind_example;  // string | Filter Kind (optional)  (default to tenant1:public:well:1.0.2)

            try
            {
                // Get all record from kind
                StorageQueryResponse result = apiInstance.GetAllRecordFromKind(oSDUAccountId, cursor, limit, kind);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.GetAllRecordFromKind: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **cursor** | **string**| Cursor | [optional] 
 **limit** | **int?**| Page Size | [optional] [default to 10]
 **kind** | **string**| Filter Kind | [optional] [default to tenant1:public:well:1.0.2]

### Return type

[**StorageQueryResponse**](StorageQueryResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getallrecordversions"></a>
# **GetAllRecordVersions**
> StorageRecordVersions GetAllRecordVersions (string id, string oSDUAccountId)

Get all record versions

The API returns a list containing all versions for the given record id. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetAllRecordVersionsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var id = id_example;  // string | Record id
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)

            try
            {
                // Get all record versions
                StorageRecordVersions result = apiInstance.GetAllRecordVersions(id, oSDUAccountId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.GetAllRecordVersions: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| Record id | 
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

[**StorageRecordVersions**](StorageRecordVersions.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getrecord"></a>
# **GetRecord**
> StorageRecordData GetRecord (string id, string oSDUAccountId, List<string> attribute = null)

Get record

This API returns the latest version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetRecordExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var id = id_example;  // string | Record id
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
            var attribute = new List<string>(); // List<string> | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. (optional) 

            try
            {
                // Get record
                StorageRecordData result = apiInstance.GetRecord(id, oSDUAccountId, attribute);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.GetRecord: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| Record id | 
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**List&lt;string&gt;**](string.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional] 

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getrecordversion"></a>
# **GetRecordVersion**
> StorageRecordData GetRecordVersion (string id, long? version, string oSDUAccountId, List<string> attribute = null)

Get record version

The API retrieves the specific version of the given record. Allowed roles: service.storage.viewer, service.storage.creator and service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetRecordVersionExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var id = id_example;  // string | Record id
            var version = 789;  // long? | Record version
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
            var attribute = new List<string>(); // List<string> | Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. (optional) 

            try
            {
                // Get record version
                StorageRecordData result = apiInstance.GetRecordVersion(id, version, oSDUAccountId, attribute);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.GetRecordVersion: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| Record id | 
 **version** | **long?**| Record version | 
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **attribute** | [**List&lt;string&gt;**](string.md)| Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}. | [optional] 

### Return type

[**StorageRecordData**](StorageRecordData.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="patchupdaterecords"></a>
# **PatchUpdateRecords**
> StorageBulkUpdateRecordsResponse PatchUpdateRecords (string oSDUAccountId, List<StorageRecordBulkUpdateParam> body = null)

Modify record metadata attributes using patch operations

The API represents the patch update mechanism for records. It allows updating multiple records in one request. The currently supported operations are replace, add, and remove for Legal Tags, ACLs, and Tags.  Required roles: 'users.datalake.editors' or 'users.datalake.admins'.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class PatchUpdateRecordsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)
            var body = new List<StorageRecordBulkUpdateParam>(); // List<StorageRecordBulkUpdateParam> |  (optional) 

            try
            {
                // Modify record metadata attributes using patch operations
                StorageBulkUpdateRecordsResponse result = apiInstance.PatchUpdateRecords(oSDUAccountId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.PatchUpdateRecords: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]
 **body** | [**List&lt;StorageRecordBulkUpdateParam&gt;**](StorageRecordBulkUpdateParam.md)|  | [optional] 

### Return type

[**StorageBulkUpdateRecordsResponse**](StorageBulkUpdateRecordsResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="purgerecord"></a>
# **PurgeRecord**
> void PurgeRecord (string id, string oSDUAccountId)

Purge record

The API performs the physical deletion of the given record and all of its versions. This operation cannot be undone. Allowed roles: service.storage.admin.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class PurgeRecordExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new StorageApi();
            var id = id_example;  // string | Record id
            var oSDUAccountId = oSDUAccountId_example;  // string | Account ID is the active OSDU account (OSDU account or customer's account) which the users choose to use with the Search API. (default to tenant1)

            try
            {
                // Purge record
                apiInstance.PurgeRecord(id, oSDUAccountId);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling StorageApi.PurgeRecord: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| Record id | 
 **oSDUAccountId** | **string**| Account ID is the active OSDU account (OSDU account or customer&#39;s account) which the users choose to use with the Search API. | [default to tenant1]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

