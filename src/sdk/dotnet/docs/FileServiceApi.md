# OsduClient.Api.FileServiceApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeletesMetadataRecordFileForTheGivenId**](FileServiceApi.md#deletesmetadatarecordfileforthegivenid) | **DELETE** /api/file/v2/files/{Id}/metadata | Deletes metadata record &amp; file assocaited with that record for the given id
[**GetALocationInLandingZoneToUploadAFile_**](FileServiceApi.md#getalocationinlandingzonetouploadafile_) | **POST** /api/file/v2/getLocation | Get a location in Landing Zone to upload a file.
[**GetTheLocationToUploadAFile**](FileServiceApi.md#getthelocationtouploadafile) | **GET** /api/file/v2/files/UploadURL | Get a location in Landing Zone to upload a file.
[**GetsMetadataRecordForTheGivenId**](FileServiceApi.md#getsmetadatarecordforthegivenid) | **GET** /api/file/v2/files/{Id}/metadata | Gets metadata record for the given id
[**GetsURLToDownloadTheFileAssociatedWithTheGivenId_**](FileServiceApi.md#getsurltodownloadthefileassociatedwiththegivenid_) | **GET** /api/file/v2/files/{Id}/DownloadURL | Gets a URL to download the file
[**PublishFileMetadataForAFile_**](FileServiceApi.md#publishfilemetadataforafile_) | **POST** /api/file/v2/files/metadata | Creates metadata for a file


<a name="deletesmetadatarecordfileforthegivenid"></a>
# **DeletesMetadataRecordFileForTheGivenId**
> void DeletesMetadataRecordFileForTheGivenId (string dataPartitionId, string id)

Deletes metadata record & file assocaited with that record for the given id

Deletes the File metadata record identified by the given id and file associated with that metadata record. **Required roles**: 'users.datalake.editors'  or 'users.datalake.admins'.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeletesMetadataRecordFileForTheGivenIdExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var id = id_example;  // string | File metadata record Id.

            try
            {
                // Deletes metadata record & file assocaited with that record for the given id
                apiInstance.DeletesMetadataRecordFileForTheGivenId(dataPartitionId, id);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceApi.DeletesMetadataRecordFileForTheGivenId: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **id** | **string**| File metadata record Id. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getalocationinlandingzonetouploadafile_"></a>
# **GetALocationInLandingZoneToUploadAFile_**
> FileLandingZoneLocationResponse GetALocationInLandingZoneToUploadAFile_ (string dataPartitionId, FileLocationRequest body = null)

Get a location in Landing Zone to upload a file.

Create a new location in the landing zone to upload a file. **Required roles**: 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'. 

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetALocationInLandingZoneToUploadAFile_Example
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var body = new FileLocationRequest(); // FileLocationRequest |  (optional) 

            try
            {
                // Get a location in Landing Zone to upload a file.
                FileLandingZoneLocationResponse result = apiInstance.GetALocationInLandingZoneToUploadAFile_(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceApi.GetALocationInLandingZoneToUploadAFile_: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileLocationRequest**](FileLocationRequest.md)|  | [optional] 

### Return type

[**FileLandingZoneLocationResponse**](FileLandingZoneLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getthelocationtouploadafile"></a>
# **GetTheLocationToUploadAFile**
> FileSourceLocationResponse GetTheLocationToUploadAFile (string dataPartitionId)

Get a location in Landing Zone to upload a file.

Gets a temporary signed URL to upload a file.The generated URL is time bound and expires after 24 hours. User will receive a FileSource in the response.This is the relative path where the uploaded file will persist. Once the file is uploaded, FileSource can then be used to post metadata of the file. The uploaded file gets automatically deleted, if the metadata is not posted within 24 hours of uploading the file. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetTheLocationToUploadAFileExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.

            try
            {
                // Get a location in Landing Zone to upload a file.
                FileSourceLocationResponse result = apiInstance.GetTheLocationToUploadAFile(dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceApi.GetTheLocationToUploadAFile: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 

### Return type

[**FileSourceLocationResponse**](FileSourceLocationResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getsmetadatarecordforthegivenid"></a>
# **GetsMetadataRecordForTheGivenId**
> FileRecordVersion GetsMetadataRecordForTheGivenId (string dataPartitionId, string id)

Gets metadata record for the given id

Gets the latest version of File metadata record identified by the given id. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetsMetadataRecordForTheGivenIdExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var id = id_example;  // string | File metadata record Id.

            try
            {
                // Gets metadata record for the given id
                FileRecordVersion result = apiInstance.GetsMetadataRecordForTheGivenId(dataPartitionId, id);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceApi.GetsMetadataRecordForTheGivenId: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **id** | **string**| File metadata record Id. | 

### Return type

[**FileRecordVersion**](FileRecordVersion.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getsurltodownloadthefileassociatedwiththegivenid_"></a>
# **GetsURLToDownloadTheFileAssociatedWithTheGivenId_**
> FileDownloadResponse GetsURLToDownloadTheFileAssociatedWithTheGivenId_ (string dataPartitionId, string id, string expiryTime = null)

Gets a URL to download the file

Gets a URL for downloading the file associated with the unique `id`. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class GetsURLToDownloadTheFileAssociatedWithTheGivenId_Example
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var id = id_example;  // string | File Metadata record Id.
            var expiryTime = expiryTime_example;  // string | The Time for which Signed URL to be valid. Accepted Regex patterns are \"^[0-9]+M$\", \"^[0-9]+H$\", \"^[0-9]+D$\" denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days. (optional) 

            try
            {
                // Gets a URL to download the file
                FileDownloadResponse result = apiInstance.GetsURLToDownloadTheFileAssociatedWithTheGivenId_(dataPartitionId, id, expiryTime);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceApi.GetsURLToDownloadTheFileAssociatedWithTheGivenId_: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **id** | **string**| File Metadata record Id. | 
 **expiryTime** | **string**| The Time for which Signed URL to be valid. Accepted Regex patterns are \&quot;^[0-9]+M$\&quot;, \&quot;^[0-9]+H$\&quot;, \&quot;^[0-9]+D$\&quot; denoting Integer values in Minutes, Hours, Days respectively. In absence of this parameter the URL would be valid for 7 Days. | [optional] 

### Return type

[**FileDownloadResponse**](FileDownloadResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="publishfilemetadataforafile_"></a>
# **PublishFileMetadataForAFile_**
> FileMetadataResponse PublishFileMetadataForAFile_ (string dataPartitionId, FileMetadata body = null)

Creates metadata for a file

This API creates a metadata record for a file that is already uploaded. The Metadata is linked to the file via `FileSource` provided in the request body. If `FileSource` attribute is missing in the request body or there is no file present, then the request fails with an error. When metadata is successfully updated in the system, it returns the `Id` of the file metadata record. **Required roles**: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins' or 'users.datalake.ops'.

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class PublishFileMetadataForAFile_Example
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new FileServiceApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var body = new FileMetadata(); // FileMetadata | File metadata content (optional) 

            try
            {
                // Creates metadata for a file
                FileMetadataResponse result = apiInstance.PublishFileMetadataForAFile_(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling FileServiceApi.PublishFileMetadataForAFile_: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition. | 
 **body** | [**FileMetadata**](FileMetadata.md)| File metadata content | [optional] 

### Return type

[**FileMetadataResponse**](FileMetadataResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

