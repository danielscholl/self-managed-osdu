# FileToOneRelationship

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**confidence** | **float** | The confidence of the relationship. If the property is absent a well-known relation is implied. | [optional] 
**id** | **str** | The id of the related object in the Data Ecosystem. If set, the id has priority over the natural key in the name property. | [optional] 
**name** | **str** | The name or natural key of the related object. This property is required if the target object id could not (yet) be identified. | [optional] 
**version** | **float** | The version number of the related entity. If no version number is specified, the last version is implied. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


