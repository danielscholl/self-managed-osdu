# SelfManagedOsdu.StorageBulkUpdateRecordsResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**recordCount** | **Number** | Number of records which updated successfully. | [optional] 
**recordIds** | **[String]** | List of successfully updated record ids. | [optional] 
**notFoundRecordIds** | **[String]** | List of record ids for whom RecordMetadata was not found | [optional] 
**unAuthorizedRecordIds** | **[String]** | List of record ids for whom user does not has owner permissions | [optional] 
**lockedRecordIds** | **[String]** | List of locked record ids | [optional] 


