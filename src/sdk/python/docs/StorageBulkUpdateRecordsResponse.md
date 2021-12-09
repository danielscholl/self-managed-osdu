# StorageBulkUpdateRecordsResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**record_count** | **int** | Number of records which updated successfully. | [optional] 
**record_ids** | **list[str]** | List of successfully updated record ids. | [optional] 
**not_found_record_ids** | **list[str]** | List of record ids for whom RecordMetadata was not found | [optional] 
**un_authorized_record_ids** | **list[str]** | List of record ids for whom user does not has owner permissions | [optional] 
**locked_record_ids** | **list[str]** | List of locked record ids | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


