
# StorageBulkUpdateRecordsResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**recordCount** | **Integer** | Number of records which updated successfully. |  [optional]
**recordIds** | **List&lt;String&gt;** | List of successfully updated record ids. |  [optional]
**notFoundRecordIds** | **List&lt;String&gt;** | List of record ids for whom RecordMetadata was not found |  [optional]
**unAuthorizedRecordIds** | **List&lt;String&gt;** | List of record ids for whom user does not has owner permissions |  [optional]
**lockedRecordIds** | **List&lt;String&gt;** | List of locked record ids |  [optional]



