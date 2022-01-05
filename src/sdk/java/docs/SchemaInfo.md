
# SchemaInfo

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**createdBy** | **String** | The user who created the schema. This value is taken from API caller token. |  [optional]
**dateCreated** | [**OffsetDateTime**](OffsetDateTime.md) | The UTC date time of the entity creation |  [optional]
**schemaIdentity** | [**SchemaIdentity**](SchemaIdentity.md) |  | 
**scope** | [**ScopeEnum**](#ScopeEnum) | Schema Scope - is it internal or shared. This is a system defined attribute based on partition-id passed. |  [optional]
**status** | [**StatusEnum**](#StatusEnum) | Schema lifecycle status | 
**supersededBy** | [**SchemaIdentity**](SchemaIdentity.md) |  |  [optional]


<a name="ScopeEnum"></a>
## Enum: ScopeEnum
Name | Value
---- | -----
INTERNAL | &quot;INTERNAL&quot;
SHARED | &quot;SHARED&quot;


<a name="StatusEnum"></a>
## Enum: StatusEnum
Name | Value
---- | -----
PUBLISHED | &quot;PUBLISHED&quot;
OBSOLETE | &quot;OBSOLETE&quot;
DEVELOPMENT | &quot;DEVELOPMENT&quot;



