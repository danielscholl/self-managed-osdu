# OsduClient.Model.StorageBulkUpdateRecordsResponse
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**RecordCount** | **int?** | Number of records which updated successfully. | [optional] 
**RecordIds** | **List&lt;string&gt;** | List of successfully updated record ids. | [optional] 
**NotFoundRecordIds** | **List&lt;string&gt;** | List of record ids for whom RecordMetadata was not found | [optional] 
**UnAuthorizedRecordIds** | **List&lt;string&gt;** | List of record ids for whom user does not has owner permissions | [optional] 
**LockedRecordIds** | **List&lt;string&gt;** | List of locked record ids | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

