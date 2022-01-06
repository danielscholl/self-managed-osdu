# SelfManagedOsdu.FileMetaItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | **String** | The kind of reference, unit, measurement, CRS or azimuth reference. | 
**name** | **String** | The name of the CRS or the symbol/name of the unit | [optional] 
**persistableReference** | **String** | The persistable reference string uniquely identifying the CRS or Unit | 
**propertyNames** | **[String]** | The list of property names, to which this meta data item provides Unit/CRS context to. Data structures, which come in a single frame of reference, can register the property name, others require a full path like \"data.structureA.propertyB\" to define a unique context. | [optional] 
**propertyValues** | **[String]** | The list of property values, to which this meta data item provides Unit/CRS context to. Typically a unit symbol is a value to a data structure; this symbol is then registered in this propertyValues array and the persistableReference provides the absolute reference. | [optional] 
**uncertainty** | **Number** | The uncertainty of the values measured given the unit or CRS unit. | [optional] 


<a name="KindEnum"></a>
## Enum: KindEnum


* `CRS` (value: `"CRS"`)

* `unit` (value: `"Unit"`)

* `measurement` (value: `"Measurement"`)

* `azimuthReference` (value: `"AzimuthReference"`)

* `dateTime` (value: `"DateTime"`)




