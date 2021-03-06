# SelfManagedOsdu.FileRecordVersion

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier generated by the system for the file metadata record. | [optional] 
**kind** | **String** | Kind of data being ingested. Must follow the naming convention:data-Partition-Id}:dataset-name}:record-type}:version}. | [optional] 
**acl** | [**FileAcl**](FileAcl.md) |  | [optional] 
**legal** | [**FileLegal**](FileLegal.md) |  | [optional] 
**data** | [**Files**](Files.md) |  | [optional] 
**ancestry** | [**FileAncestry**](FileAncestry.md) |  | [optional] 
**version** | **Number** | The version number of this OSDU resource; set by the framework. | [optional] 


