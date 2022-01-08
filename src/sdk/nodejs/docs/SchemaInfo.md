# SelfManagedOsdu.SchemaInfo

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**createdBy** | **String** | The user who created the schema. This value is taken from API caller token. | [optional] 
**dateCreated** | **Date** | The UTC date time of the entity creation | [optional] 
**schemaIdentity** | [**SchemaIdentity**](SchemaIdentity.md) |  | 
**scope** | **String** | Schema Scope - is it internal or shared. This is a system defined attribute based on partition-id passed. | [optional] 
**status** | **String** | Schema lifecycle status | 
**supersededBy** | [**SchemaIdentity**](SchemaIdentity.md) |  | [optional] 


<a name="ScopeEnum"></a>
## Enum: ScopeEnum


* `INTERNAL` (value: `"INTERNAL"`)

* `SHARED` (value: `"SHARED"`)




<a name="StatusEnum"></a>
## Enum: StatusEnum


* `PUBLISHED` (value: `"PUBLISHED"`)

* `OBSOLETE` (value: `"OBSOLETE"`)

* `DEVELOPMENT` (value: `"DEVELOPMENT"`)




