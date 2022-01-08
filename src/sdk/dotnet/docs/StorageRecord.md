# OsduClient.Model.StorageRecord
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Id** | **string** | Unique identifier in whole Data Lake. When not provided, Data Lake will create and assign an id to the record. Must follow the naming convention: {OSDU-Account-Id}:{object-type}:{uuid}. | [optional] 
**Kind** | **string** | Kind of data it is being ingested. Must follow the naming convention: {OSDU-Account-Id}:{dataset-name}:{record-type}:{version}. | 
**Acl** | [**StorageAcl**](StorageAcl.md) | Group of users who have access to the record. | 
**Legal** | [**StorageLegal**](StorageLegal.md) | Attributes which represent the legal constraints associated with the record. | 
**Data** | **Dictionary&lt;string, Object&gt;** | Record payload represented as a list of key-value pairs. | 
**History** | [**StorageRecordHistory**](StorageRecordHistory.md) | Record ancestry information. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

