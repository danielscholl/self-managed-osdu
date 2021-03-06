# OsduClient - the C# library for the self-managed-osdu

Rest API Documentation for Self Managed OSDU

This C# SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 0.11.0
- SDK version: 1.0.0
- Build package: io.swagger.codegen.languages.CSharpClientCodegen

<a name="frameworks-supported"></a>
## Frameworks supported
- .NET 4.0 or later
- Windows Phone 7.1 (Mango)

<a name="dependencies"></a>
## Dependencies
- [RestSharp](https://www.nuget.org/packages/RestSharp) - 105.1.0 or later
- [Json.NET](https://www.nuget.org/packages/Newtonsoft.Json/) - 7.0.0 or later
- [JsonSubTypes](https://www.nuget.org/packages/JsonSubTypes/) - 1.2.0 or later

The DLLs included in the package may not be the latest version. We recommend using [NuGet](https://docs.nuget.org/consume/installing-nuget) to obtain the latest version of the packages:
```
Install-Package RestSharp
Install-Package Newtonsoft.Json
Install-Package JsonSubTypes
```

NOTE: RestSharp versions greater than 105.1.0 have a bug which causes file uploads to fail. See [RestSharp#742](https://github.com/restsharp/RestSharp/issues/742)

<a name="installation"></a>
## Installation
Run the following command to generate the DLL
- [Mac/Linux] `/bin/sh build.sh`
- [Windows] `build.bat`

Then include the DLL (under the `bin` folder) in the C# project, and use the namespaces:
```csharp
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;
```
<a name="packaging"></a>
## Packaging

A `.nuspec` is included with the project. You can follow the Nuget quickstart to [create](https://docs.microsoft.com/en-us/nuget/quickstart/create-and-publish-a-package#create-the-package) and [publish](https://docs.microsoft.com/en-us/nuget/quickstart/create-and-publish-a-package#publish-the-package) packages.

This `.nuspec` uses placeholders from the `.csproj`, so build the `.csproj` directly:

```
nuget pack -Build -OutputDirectory out OsduClient.csproj
```

Then, publish to a [local feed](https://docs.microsoft.com/en-us/nuget/hosting-packages/local-feeds) or [other host](https://docs.microsoft.com/en-us/nuget/hosting-packages/overview) and consume the new package via Nuget as usual.

<a name="getting-started"></a>
## Getting Started

```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class Example
    {
        public void main()
        {

            // Configure API key authorization: Bearer
            Configuration.Default.ApiKey.Add("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.ApiKeyPrefix.Add("Authorization", "Bearer");

            var apiInstance = new DeliveryAPIApi();
            var dataPartitionId = dataPartitionId_example;  // string | Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
            var body = new FileDeliveryGetFileSignedURLRequest(); // FileDeliveryGetFileSignedURLRequest |  (optional) 

            try
            {
                FileDeliveryGetFileSignedURLResponse result = apiInstance.ReturnsDeliveryInstructionsForFileSUsingSRNs(dataPartitionId, body);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling DeliveryAPIApi.ReturnsDeliveryInstructionsForFileSUsingSRNs: " + e.Message );
            }

        }
    }
}
```

<a name="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DeliveryAPIApi* | [**ReturnsDeliveryInstructionsForFileSUsingSRNs**](docs/DeliveryAPIApi.md#returnsdeliveryinstructionsforfilesusingsrns) | **POST** /api/file/v2/delivery/getFileSignedUrl | 
*EntitlementApi* | [**AddMemberUsingPOST**](docs/EntitlementApi.md#addmemberusingpost) | **POST** /api/entitlements/v2/groups/{group_email}/members | Add Member to Group
*EntitlementApi* | [**CreateGroupUsingPOST**](docs/EntitlementApi.md#creategroupusingpost) | **POST** /api/entitlements/v2/groups | Create a Group
*EntitlementApi* | [**DeleteGroupUsingDELETE**](docs/EntitlementApi.md#deletegroupusingdelete) | **DELETE** /api/entitlements/v2/groups/{group_email} | Delete a Group
*EntitlementApi* | [**DeleteMemberUsingDELETE**](docs/EntitlementApi.md#deletememberusingdelete) | **DELETE** /api/entitlements/v2/members/{member_email} | Delete a User
*EntitlementApi* | [**DeleteMemberUsingDELETE1**](docs/EntitlementApi.md#deletememberusingdelete1) | **DELETE** /api/entitlements/v2/groups/{group_email}/members/{member_email} | Remove Member from Group
*EntitlementApi* | [**ListGroupMembersUsingGET**](docs/EntitlementApi.md#listgroupmembersusingget) | **GET** /api/entitlements/v2/groups/{group_email}/members | List Group Members
*EntitlementApi* | [**ListGroupsOnBehalfOfUsingGET**](docs/EntitlementApi.md#listgroupsonbehalfofusingget) | **GET** /api/entitlements/v2/members/{member_email}/groups | List Assigned Groups for User
*EntitlementApi* | [**ListGroupsUsingGET**](docs/EntitlementApi.md#listgroupsusingget) | **GET** /api/entitlements/v2/groups | List Assigned Groups
*EntitlementApi* | [**UpdateGroupUsingPATCH**](docs/EntitlementApi.md#updategroupusingpatch) | **PATCH** /api/entitlements/v2/groups/{group_email} | Updates Items in Group
*FileServiceApi* | [**DeletesMetadataRecordFileForTheGivenId**](docs/FileServiceApi.md#deletesmetadatarecordfileforthegivenid) | **DELETE** /api/file/v2/files/{Id}/metadata | Deletes metadata record & file assocaited with that record for the given id
*FileServiceApi* | [**GetALocationInLandingZoneToUploadAFile_**](docs/FileServiceApi.md#getalocationinlandingzonetouploadafile_) | **POST** /api/file/v2/getLocation | Get a location in Landing Zone to upload a file.
*FileServiceApi* | [**GetTheLocationToUploadAFile**](docs/FileServiceApi.md#getthelocationtouploadafile) | **GET** /api/file/v2/files/uploadURL | Get a location in Landing Zone to upload a file.
*FileServiceApi* | [**GetsMetadataRecordForTheGivenId**](docs/FileServiceApi.md#getsmetadatarecordforthegivenid) | **GET** /api/file/v2/files/{Id}/metadata | Gets metadata record for the given id
*FileServiceApi* | [**GetsURLToDownloadTheFileAssociatedWithTheGivenId_**](docs/FileServiceApi.md#getsurltodownloadthefileassociatedwiththegivenid_) | **GET** /api/file/v2/files/{Id}/DownloadURL | Gets a URL to download the file
*FileServiceApi* | [**PublishFileMetadataForAFile_**](docs/FileServiceApi.md#publishfilemetadataforafile_) | **POST** /api/file/v2/files/metadata | Creates metadata for a file
*LegalApi* | [**CreateLegalTag**](docs/LegalApi.md#createlegaltag) | **POST** /api/legal/v1/legaltags | Creates the LegalTag for the given 'name'.
*LegalApi* | [**DeleteLegalTag**](docs/LegalApi.md#deletelegaltag) | **DELETE** /api/legal/v1/legaltags/{name} | Delete Legal Tag
*LegalApi* | [**GetLegalTag**](docs/LegalApi.md#getlegaltag) | **GET** /api/legal/v1/legaltags/{name} | Gets a LegalTag for the given 'name'.
*LegalApi* | [**GetLegalTagProperties**](docs/LegalApi.md#getlegaltagproperties) | **GET** /api/legal/v1/legaltags:properties | Gets LegalTag property values.
*LegalApi* | [**GetLegalTags**](docs/LegalApi.md#getlegaltags) | **POST** /api/legal/v1/legaltags:batchRetrieve | Retrieves the LegalTags for the given names.
*LegalApi* | [**ListLegalTags**](docs/LegalApi.md#listlegaltags) | **GET** /api/legal/v1/legaltags | Gets all LegalTags.
*LegalApi* | [**UpdateLegalTag**](docs/LegalApi.md#updatelegaltag) | **PUT** /api/legal/v1/legaltags | Updates the LegalTag for the given 'name'.
*LegalApi* | [**ValidateLegalTags**](docs/LegalApi.md#validatelegaltags) | **POST** /api/legal/v1/legaltags:validate | Retrieves the invalid LegalTag names with reasons for the given names.
*NotificationApi* | [**RecordChangedUsingPOST**](docs/NotificationApi.md#recordchangedusingpost) | **POST** /api/notification/v1/push-handlers/records-changed | Notifies subscribers that records have changed
*PartitionApi* | [**CreateUsingPOST**](docs/PartitionApi.md#createusingpost) | **POST** /api/partition/v1/partitions/{partitionId} | Create Partition
*PartitionApi* | [**DeleteUsingDELETE**](docs/PartitionApi.md#deleteusingdelete) | **DELETE** /api/partition/v1/partitions/{partitionId} | Delete Partition
*PartitionApi* | [**GetUsingGET**](docs/PartitionApi.md#getusingget) | **GET** /api/partition/v1/partitions/{partitionId} | Get Single Partition
*PartitionApi* | [**ListUsingGET**](docs/PartitionApi.md#listusingget) | **GET** /api/partition/v1/partitions | List Partitions
*PartitionApi* | [**UpdateUsingPATCH**](docs/PartitionApi.md#updateusingpatch) | **PATCH** /api/partition/v1/partitions/{partitionId} | Update Partition
*RegisterApi* | [**CreateADDMSRegistration**](docs/RegisterApi.md#createaddmsregistration) | **POST** /api/register/v1/ddms | Create a DDMS registration
*RegisterApi* | [**CreateASubscription**](docs/RegisterApi.md#createasubscription) | **POST** /api/register/v1/subscription | Create a subscription
*RegisterApi* | [**CreateAnActionRegistration**](docs/RegisterApi.md#createanactionregistration) | **POST** /api/register/v1/action | Create an action registration
*RegisterApi* | [**DeleteADDMSRegistration**](docs/RegisterApi.md#deleteaddmsregistration) | **DELETE** /api/register/v1/ddms/{id} | Delete a DDMS registration
*RegisterApi* | [**DeleteASubscriptionById**](docs/RegisterApi.md#deleteasubscriptionbyid) | **DELETE** /api/register/v1/subscription/{id} | Delete a subscription
*RegisterApi* | [**DeleteAnActionRegistration**](docs/RegisterApi.md#deleteanactionregistration) | **DELETE** /api/register/v1/action/{id} | Delete an action  registration
*RegisterApi* | [**GetADDMSRegistration**](docs/RegisterApi.md#getaddmsregistration) | **GET** /api/register/v1/ddms/{id} | Get a DDMS registration
*RegisterApi* | [**GetASubscriptionById**](docs/RegisterApi.md#getasubscriptionbyid) | **GET** /api/register/v1/subscription/{id} | Get a subscription
*RegisterApi* | [**GetAnActionRegistration**](docs/RegisterApi.md#getanactionregistration) | **GET** /api/register/v1/action/{id} | Get an action registration
*RegisterApi* | [**ListAllTopics**](docs/RegisterApi.md#listalltopics) | **GET** /api/register/v1/topics | List all topics
*RegisterApi* | [**QueryADDMSRegistration**](docs/RegisterApi.md#queryaddmsregistration) | **GET** /api/register/v1/ddms | Query for DDMS registrations
*RegisterApi* | [**RetrieveAnActionRegistration**](docs/RegisterApi.md#retrieveanactionregistration) | **POST** /api/register/v1/action:retrieve | Query for action registrations and substitutes any action with the given parameters
*RegisterApi* | [**TestAnActionRegistration**](docs/RegisterApi.md#testanactionregistration) | **POST** /api/register/v1/action:test | Test an action registration
*RegisterApi* | [**UpdateSecretForSubscription**](docs/RegisterApi.md#updatesecretforsubscription) | **PUT** /api/register/v1/subscription/{id}/secret | Update secret for subscription
*SchemaApi* | [**CreateSchema**](docs/SchemaApi.md#createschema) | **POST** /api/schema-service/v1/schema | Adds a schema to the schema repository.
*SchemaApi* | [**GetSchema**](docs/SchemaApi.md#getschema) | **GET** /api/schema-service/v1/schema/{id} | Gets schema from the schema repository.
*SchemaApi* | [**SearchSchemaInfoRepository**](docs/SchemaApi.md#searchschemainforepository) | **GET** /api/schema-service/v1/schema | Searches schemaInfo repository
*SchemaApi* | [**UpdateSchema**](docs/SchemaApi.md#updateschema) | **PUT** /api/schema-service/v1/schema | Creates/Updates a schema in development status
*SearchApi* | [**DeleteIndex**](docs/SearchApi.md#deleteindex) | **DELETE** /api/search/v2/index/{kind} | Deletes all documents from index for given 'kind'.
*SearchApi* | [**GetKindSchema**](docs/SearchApi.md#getkindschema) | **GET** /api/search/v2/index/schema/{kind} | Returns the index schema for given 'kind'.
*SearchApi* | [**QueryRecords**](docs/SearchApi.md#queryrecords) | **POST** /api/search/v2/query | Queries the index for the specified kind using the input query string.
*SearchApi* | [**QueryWithCursor**](docs/SearchApi.md#querywithcursor) | **POST** /api/search/v2/query_with_cursor | Query the index using cursor and optionally return only requested fields.
*StorageApi* | [**CreateOrUpdateRecords**](docs/StorageApi.md#createorupdaterecords) | **PUT** /api/storage/v2/records | Create or update records
*StorageApi* | [**DeleteRecord**](docs/StorageApi.md#deleterecord) | **POST** /api/records/{id}:delete | Delete record
*StorageApi* | [**DeleteRecords**](docs/StorageApi.md#deleterecords) | **POST** /api/storage/v2/records/delete | Soft delete of multiple records
*StorageApi* | [**FetchRecords**](docs/StorageApi.md#fetchrecords) | **POST** /api/storage/v2/query/records | Fetch records
*StorageApi* | [**GetAllKinds**](docs/StorageApi.md#getallkinds) | **GET** /api/storage/v2/query/kinds | Get all kinds
*StorageApi* | [**GetAllRecordFromKind**](docs/StorageApi.md#getallrecordfromkind) | **GET** /api/storage/v2/query/records | Get all record from kind
*StorageApi* | [**GetAllRecordVersions**](docs/StorageApi.md#getallrecordversions) | **GET** /api/storage/v2/records/versions/{id} | Get all record versions
*StorageApi* | [**GetRecord**](docs/StorageApi.md#getrecord) | **GET** /api/storage/v2/records/{id} | Get record
*StorageApi* | [**GetRecordVersion**](docs/StorageApi.md#getrecordversion) | **GET** /api/storage/v2/records/{id}/{version} | Get record version
*StorageApi* | [**PatchUpdateRecords**](docs/StorageApi.md#patchupdaterecords) | **PATCH** /api/storage/v2/records | Modify record metadata attributes using patch operations
*StorageApi* | [**PurgeRecord**](docs/StorageApi.md#purgerecord) | **DELETE** /api/storage/v2/records/{id} | Purge record
*WorkflowApi* | [**DeleteWorkflow**](docs/WorkflowApi.md#deleteworkflow) | **DELETE** /api/workflow/v1/workflow/{workflow_name} | Delete a workflow defintion.
*WorkflowApi* | [**DeployWorkflow**](docs/WorkflowApi.md#deployworkflow) | **POST** /api/workflow/v1/workflow | Creates workflow definition with standard orchestrator operators.
*WorkflowApi* | [**GetAllWorkflowRuns**](docs/WorkflowApi.md#getallworkflowruns) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Get all run instances of a workflow.
*WorkflowApi* | [**GetWorkflowRun**](docs/WorkflowApi.md#getworkflowrun) | **GET** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Get details for a speciffic workflow run instance.
*WorkflowApi* | [**ListAllWorkflow**](docs/WorkflowApi.md#listallworkflow) | **GET** /api/workflow/v1/workflow | List all the workflow applicable for a tenant.
*WorkflowApi* | [**TriggerWorkflow**](docs/WorkflowApi.md#triggerworkflow) | **POST** /api/workflow/v1/workflow/{workflow_name}/workflowRun | Trigger a workflow.
*WorkflowApi* | [**UpdateWorkflowRun**](docs/WorkflowApi.md#updateworkflowrun) | **PUT** /api/workflow/v1/workflow/{workflow_name}/workflowRun/{runId} | Update the workflow run instance.
*WorkflowApi* | [**ViewWorkflow**](docs/WorkflowApi.md#viewworkflow) | **GET** /api/workflow/v1/workflow/{workflow_name} | Get complete details for a workflow.


<a name="documentation-for-models"></a>
## Documentation for Models

 - [Model.EntitlementGroupProperties](docs/EntitlementGroupProperties.md)
 - [Model.EntitlementGroupResponse](docs/EntitlementGroupResponse.md)
 - [Model.EntitlementMemberDto](docs/EntitlementMemberDto.md)
 - [Model.FileAcl](docs/FileAcl.md)
 - [Model.FileAncestry](docs/FileAncestry.md)
 - [Model.FileApplicationError](docs/FileApplicationError.md)
 - [Model.FileDeliveryGetFileSignedURLRequest](docs/FileDeliveryGetFileSignedURLRequest.md)
 - [Model.FileDeliveryGetFileSignedURLResponse](docs/FileDeliveryGetFileSignedURLResponse.md)
 - [Model.FileDetails](docs/FileDetails.md)
 - [Model.FileDownloadResponse](docs/FileDownloadResponse.md)
 - [Model.FileError](docs/FileError.md)
 - [Model.FileErrorModel](docs/FileErrorModel.md)
 - [Model.FileExtensionProperties](docs/FileExtensionProperties.md)
 - [Model.FileLandingZoneLocationResponse](docs/FileLandingZoneLocationResponse.md)
 - [Model.FileLegal](docs/FileLegal.md)
 - [Model.FileLocationRequest](docs/FileLocationRequest.md)
 - [Model.FileMetaItem](docs/FileMetaItem.md)
 - [Model.FileMetadata](docs/FileMetadata.md)
 - [Model.FileMetadataResponse](docs/FileMetadataResponse.md)
 - [Model.FileRecordVersion](docs/FileRecordVersion.md)
 - [Model.FileRelationships](docs/FileRelationships.md)
 - [Model.FileSourceLocationResponse](docs/FileSourceLocationResponse.md)
 - [Model.FileToManyRelationship](docs/FileToManyRelationship.md)
 - [Model.FileToOneRelationship](docs/FileToOneRelationship.md)
 - [Model.Files](docs/Files.md)
 - [Model.LegalTagDto](docs/LegalTagDto.md)
 - [Model.LegalTagDtos](docs/LegalTagDtos.md)
 - [Model.LegalTagInvalidResponse](docs/LegalTagInvalidResponse.md)
 - [Model.LegalTagInvalidResponseList](docs/LegalTagInvalidResponseList.md)
 - [Model.LegalTagProperties](docs/LegalTagProperties.md)
 - [Model.LegalTagPropertyValues](docs/LegalTagPropertyValues.md)
 - [Model.LegalTagRequest](docs/LegalTagRequest.md)
 - [Model.LegalTagUpdateDto](docs/LegalTagUpdateDto.md)
 - [Model.NotificationResponseEntity](docs/NotificationResponseEntity.md)
 - [Model.PartitionDto](docs/PartitionDto.md)
 - [Model.PartitionProperty](docs/PartitionProperty.md)
 - [Model.RegisterAcl](docs/RegisterAcl.md)
 - [Model.RegisterAction](docs/RegisterAction.md)
 - [Model.RegisterAppError](docs/RegisterAppError.md)
 - [Model.RegisterCreateAction](docs/RegisterCreateAction.md)
 - [Model.RegisterCreatedOnEpoch](docs/RegisterCreatedOnEpoch.md)
 - [Model.RegisterData](docs/RegisterData.md)
 - [Model.RegisterDdms](docs/RegisterDdms.md)
 - [Model.RegisterDdmsInterface](docs/RegisterDdmsInterface.md)
 - [Model.RegisterFilter](docs/RegisterFilter.md)
 - [Model.RegisterGetSubscriptionResult](docs/RegisterGetSubscriptionResult.md)
 - [Model.RegisterLegal](docs/RegisterLegal.md)
 - [Model.RegisterRecord](docs/RegisterRecord.md)
 - [Model.RegisterSecret](docs/RegisterSecret.md)
 - [Model.RegisterSubscription](docs/RegisterSubscription.md)
 - [Model.RegisterSubscriptionCreateResult](docs/RegisterSubscriptionCreateResult.md)
 - [Model.RegisterTestAction](docs/RegisterTestAction.md)
 - [Model.RegisterTestActionResult](docs/RegisterTestActionResult.md)
 - [Model.RegisterTopic](docs/RegisterTopic.md)
 - [Model.RegisterTopicExample](docs/RegisterTopicExample.md)
 - [Model.SchemaError](docs/SchemaError.md)
 - [Model.SchemaErrorModel](docs/SchemaErrorModel.md)
 - [Model.SchemaErrorResponseFormat](docs/SchemaErrorResponseFormat.md)
 - [Model.SchemaIdentity](docs/SchemaIdentity.md)
 - [Model.SchemaInfo](docs/SchemaInfo.md)
 - [Model.SchemaInfoResponse](docs/SchemaInfoResponse.md)
 - [Model.SchemaRequest](docs/SchemaRequest.md)
 - [Model.SearchAppError](docs/SearchAppError.md)
 - [Model.SearchByBoundingBox](docs/SearchByBoundingBox.md)
 - [Model.SearchByDistance](docs/SearchByDistance.md)
 - [Model.SearchByGeoPolygon](docs/SearchByGeoPolygon.md)
 - [Model.SearchCursorQueryRequest](docs/SearchCursorQueryRequest.md)
 - [Model.SearchCursorQueryResponse](docs/SearchCursorQueryResponse.md)
 - [Model.SearchPoint](docs/SearchPoint.md)
 - [Model.SearchQueryRequest](docs/SearchQueryRequest.md)
 - [Model.SearchQueryResponse](docs/SearchQueryResponse.md)
 - [Model.SearchSpatialFilter](docs/SearchSpatialFilter.md)
 - [Model.StorageAcl](docs/StorageAcl.md)
 - [Model.StorageBulkUpdateRecordsResponse](docs/StorageBulkUpdateRecordsResponse.md)
 - [Model.StorageDeleteRecordError](docs/StorageDeleteRecordError.md)
 - [Model.StorageErrorResponse](docs/StorageErrorResponse.md)
 - [Model.StorageLegal](docs/StorageLegal.md)
 - [Model.StorageMultiRecordIds](docs/StorageMultiRecordIds.md)
 - [Model.StoragePatchOperation](docs/StoragePatchOperation.md)
 - [Model.StorageQueryResponse](docs/StorageQueryResponse.md)
 - [Model.StorageRecord](docs/StorageRecord.md)
 - [Model.StorageRecordBulkUpdateParam](docs/StorageRecordBulkUpdateParam.md)
 - [Model.StorageRecordData](docs/StorageRecordData.md)
 - [Model.StorageRecordHistory](docs/StorageRecordHistory.md)
 - [Model.StorageRecordQuery](docs/StorageRecordQuery.md)
 - [Model.StorageRecordVersions](docs/StorageRecordVersions.md)
 - [Model.Workflow](docs/Workflow.md)
 - [Model.WorkflowError](docs/WorkflowError.md)
 - [Model.WorkflowErrorDetails](docs/WorkflowErrorDetails.md)
 - [Model.WorkflowRun](docs/WorkflowRun.md)
 - [Model.WorkflowTriggerRequest](docs/WorkflowTriggerRequest.md)


<a name="documentation-for-authorization"></a>
## Documentation for Authorization

<a name="Bearer"></a>
### Bearer

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header

