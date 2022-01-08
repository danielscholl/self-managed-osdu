# FileMetaItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | **str** | The kind of reference, unit, measurement, CRS or azimuth reference. | 
**name** | **str** | The name of the CRS or the symbol/name of the unit | [optional] 
**persistable_reference** | **str** | The persistable reference string uniquely identifying the CRS or Unit | 
**property_names** | **list[str]** | The list of property names, to which this meta data item provides Unit/CRS context to. Data structures, which come in a single frame of reference, can register the property name, others require a full path like \&quot;data.structureA.propertyB\&quot; to define a unique context. | [optional] 
**property_values** | **list[str]** | The list of property values, to which this meta data item provides Unit/CRS context to. Typically a unit symbol is a value to a data structure; this symbol is then registered in this propertyValues array and the persistableReference provides the absolute reference. | [optional] 
**uncertainty** | **float** | The uncertainty of the values measured given the unit or CRS unit. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


