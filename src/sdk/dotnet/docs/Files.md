# IO.Swagger.Model.Files
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Name** | **string** | An optional name of the dataset, e.g. a user friendly file or file collection name. | 
**Description** | **string** | An optional, textual description of the dataset. | [optional] 
**TotalSize** | **string** | Total size of the dataset in bytes; for files it is the same as declared in FileSourceInfo.FileSize or the sum of all individual files. Implemented as string. The value must be convertible to a long integer (sizes can become very large). | [optional] 
**EncodingFormatTypeID** | **string** | Encoding Format Type ID | [optional] 
**SchemaFormatTypeID** | **string** | Schema Format Type ID | [optional] 
**Endian** | **string** | Endianness of binary value. Enumeration- \\BIG\\ \\LITTLE\\.  If absent applications will need to interpret from context indicators. | 
**Checksum** | **string** | MD5 checksum of file bytes - a 32 byte hexadecimal number | [optional] 
**DatasetProperties** | **Object** |  | 
**ExtensionProperties** | **Object** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

