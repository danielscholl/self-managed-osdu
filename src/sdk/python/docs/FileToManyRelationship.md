# FileToManyRelationship

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**confidences** | **list[float]** | The confidences of the relationships. Keep all the arrays ordered and aligned. | [optional] 
**ids** | **list[str]** | The ids of the related objects. It is populated for an explicit relationship where the target entity is present as a record in the data ecosystem. Keep all the arrays ordered and aligned. | [optional] 
**names** | **list[str]** | The names or natural keys of the related objects. Keep all the arrays ordered and aligned. | [optional] 
**versions** | **list[float]** | The specific version numbers of the related instances. This is only specified if a specific version is required. If not populated the last version is implied. Keep all the arrays ordered and aligned. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


