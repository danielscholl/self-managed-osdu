# IO.Swagger.Model.FileMetaItem
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Kind** | **string** | The kind of reference, unit, measurement, CRS or azimuth reference. | 
**Name** | **string** | The name of the CRS or the symbol/name of the unit | [optional] 
**PersistableReference** | **string** | The persistable reference string uniquely identifying the CRS or Unit | 
**PropertyNames** | **List&lt;string&gt;** | The list of property names, to which this meta data item provides Unit/CRS context to. Data structures, which come in a single frame of reference, can register the property name, others require a full path like \&quot;data.structureA.propertyB\&quot; to define a unique context. | [optional] 
**PropertyValues** | **List&lt;string&gt;** | The list of property values, to which this meta data item provides Unit/CRS context to. Typically a unit symbol is a value to a data structure; this symbol is then registered in this propertyValues array and the persistableReference provides the absolute reference. | [optional] 
**Uncertainty** | **decimal?** | The uncertainty of the values measured given the unit or CRS unit. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

