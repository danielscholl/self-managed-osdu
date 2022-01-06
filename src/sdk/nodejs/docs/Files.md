# SelfManagedOsdu.Files

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | An optional name of the dataset, e.g. a user friendly file or file collection name. | 
**description** | **String** | An optional, textual description of the dataset. | [optional] 
**totalSize** | **String** | Total size of the dataset in bytes; for files it is the same as declared in FileSourceInfo.FileSize or the sum of all individual files. Implemented as string. The value must be convertible to a long integer (sizes can become very large). | [optional] 
**encodingFormatTypeID** | **String** | Encoding Format Type ID | [optional] 
**schemaFormatTypeID** | **String** | Schema Format Type ID | [optional] 
**endian** | **String** | Endianness of binary value. Enumeration- \\BIG\\ \\LITTLE\\.  If absent applications will need to interpret from context indicators. | 
**checksum** | **String** | MD5 checksum of file bytes - a 32 byte hexadecimal number | [optional] 
**datasetProperties** | **Object** |  | 
**extensionProperties** | **Object** |  | [optional] 


<a name="EndianEnum"></a>
## Enum: EndianEnum


* `BIG_LITTLE` (value: `"BIG LITTLE"`)




