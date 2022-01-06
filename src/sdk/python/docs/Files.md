# Files

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **str** | An optional name of the dataset, e.g. a user friendly file or file collection name. | 
**description** | **str** | An optional, textual description of the dataset. | [optional] 
**total_size** | **str** | Total size of the dataset in bytes; for files it is the same as declared in FileSourceInfo.FileSize or the sum of all individual files. Implemented as string. The value must be convertible to a long integer (sizes can become very large). | [optional] 
**encoding_format_type_id** | **str** | Encoding Format Type ID | [optional] 
**schema_format_type_id** | **str** | Schema Format Type ID | [optional] 
**endian** | **str** | Endianness of binary value. Enumeration- \\BIG\\ \\LITTLE\\.  If absent applications will need to interpret from context indicators. | 
**checksum** | **str** | MD5 checksum of file bytes - a 32 byte hexadecimal number | [optional] 
**dataset_properties** | **object** |  | 
**extension_properties** | **object** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


