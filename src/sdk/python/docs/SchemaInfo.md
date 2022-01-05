# SchemaInfo

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**created_by** | **str** | The user who created the schema. This value is taken from API caller token. | [optional] 
**date_created** | **datetime** | The UTC date time of the entity creation | [optional] 
**schema_identity** | [**SchemaIdentity**](SchemaIdentity.md) |  | 
**scope** | **str** | Schema Scope - is it internal or shared. This is a system defined attribute based on partition-id passed. | [optional] 
**status** | **str** | Schema lifecycle status | 
**superseded_by** | [**SchemaIdentity**](SchemaIdentity.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


