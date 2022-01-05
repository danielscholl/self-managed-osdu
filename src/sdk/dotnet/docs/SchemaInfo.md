# IO.Swagger.Model.SchemaInfo
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**CreatedBy** | **string** | The user who created the schema. This value is taken from API caller token. | [optional] 
**DateCreated** | **DateTime?** | The UTC date time of the entity creation | [optional] 
**SchemaIdentity** | [**SchemaIdentity**](SchemaIdentity.md) |  | 
**Scope** | **string** | Schema Scope - is it internal or shared. This is a system defined attribute based on partition-id passed. | [optional] 
**Status** | **string** | Schema lifecycle status | 
**SupersededBy** | [**SchemaIdentity**](SchemaIdentity.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

