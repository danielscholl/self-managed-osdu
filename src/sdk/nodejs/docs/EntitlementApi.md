# SelfManagedOsdu.EntitlementApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addMemberUsingPOST**](EntitlementApi.md#addMemberUsingPOST) | **POST** /api/entitlements/v2/groups/{group_email}/members | Add Member to Group
[**createGroupUsingPOST**](EntitlementApi.md#createGroupUsingPOST) | **POST** /api/entitlements/v2/groups | Create a Group
[**deleteGroupUsingDELETE**](EntitlementApi.md#deleteGroupUsingDELETE) | **DELETE** /api/entitlements/v2/groups/{group_email} | Delete a Group
[**deleteMemberUsingDELETE**](EntitlementApi.md#deleteMemberUsingDELETE) | **DELETE** /api/entitlements/v2/members/{member_email} | Delete a User
[**deleteMemberUsingDELETE1**](EntitlementApi.md#deleteMemberUsingDELETE1) | **DELETE** /api/entitlements/v2/groups/{group_email}/members/{member_email} | Remove Member from Group
[**listGroupMembersUsingGET**](EntitlementApi.md#listGroupMembersUsingGET) | **GET** /api/entitlements/v2/groups/{group_email}/members | List Group Members
[**listGroupsOnBehalfOfUsingGET**](EntitlementApi.md#listGroupsOnBehalfOfUsingGET) | **GET** /api/entitlements/v2/members/{member_email}/groups | List Assigned Groups for User
[**listGroupsUsingGET**](EntitlementApi.md#listGroupsUsingGET) | **GET** /api/entitlements/v2/groups | List Assigned Groups
[**updateGroupUsingPATCH**](EntitlementApi.md#updateGroupUsingPATCH) | **PATCH** /api/entitlements/v2/groups/{group_email} | Updates Items in Group


<a name="addMemberUsingPOST"></a>
# **addMemberUsingPOST**
> EntitlementMemberDto addMemberUsingPOST(dataPartitionId, groupEmail, partitionInfo)

Add Member to Group

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | Partition Name

var groupEmail = "groupEmail_example"; // String | group_email

var partitionInfo = new SelfManagedOsdu.EntitlementMemberDto(); // EntitlementMemberDto | partitionInfo


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.addMemberUsingPOST(dataPartitionId, groupEmail, partitionInfo, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Partition Name | 
 **groupEmail** | **String**| group_email | 
 **partitionInfo** | [**EntitlementMemberDto**](EntitlementMemberDto.md)| partitionInfo | 

### Return type

[**EntitlementMemberDto**](EntitlementMemberDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="createGroupUsingPOST"></a>
# **createGroupUsingPOST**
> createGroupUsingPOST(dataPartitionId)

Create a Group

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | Partition Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.createGroupUsingPOST(dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Partition Id | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteGroupUsingDELETE"></a>
# **deleteGroupUsingDELETE**
> deleteGroupUsingDELETE(dataPartitionId, groupEmail)

Delete a Group

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | tenant

var groupEmail = "groupEmail_example"; // String | group_email


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteGroupUsingDELETE(dataPartitionId, groupEmail, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| tenant | 
 **groupEmail** | **String**| group_email | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteMemberUsingDELETE"></a>
# **deleteMemberUsingDELETE**
> deleteMemberUsingDELETE(dataPartitionId, memberEmail)

Delete a User

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | Data Partition Id

var memberEmail = "memberEmail_example"; // String | member_email


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteMemberUsingDELETE(dataPartitionId, memberEmail, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Data Partition Id | 
 **memberEmail** | **String**| member_email | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteMemberUsingDELETE1"></a>
# **deleteMemberUsingDELETE1**
> 'String' deleteMemberUsingDELETE1(dataPartitionId, groupEmail, memberEmail)

Remove Member from Group

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | Data Partition Id

var groupEmail = "groupEmail_example"; // String | group_email

var memberEmail = "memberEmail_example"; // String | member_email


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.deleteMemberUsingDELETE1(dataPartitionId, groupEmail, memberEmail, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Data Partition Id | 
 **groupEmail** | **String**| group_email | 
 **memberEmail** | **String**| member_email | 

### Return type

**'String'**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listGroupMembersUsingGET"></a>
# **listGroupMembersUsingGET**
> listGroupMembersUsingGET(dataPartitionId, groupEmail, opts)

List Group Members

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | Data Partition Id

var groupEmail = "groupEmail_example"; // String | group_email

var opts = { 
  'role': "role_example", // String | role
  'includeType': true // Boolean | includeType
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.listGroupMembersUsingGET(dataPartitionId, groupEmail, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Data Partition Id | 
 **groupEmail** | **String**| group_email | 
 **role** | **String**| role | [optional] 
 **includeType** | **Boolean**| includeType | [optional] 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listGroupsOnBehalfOfUsingGET"></a>
# **listGroupsOnBehalfOfUsingGET**
> listGroupsOnBehalfOfUsingGET(dataPartitionId, memberEmail, opts)

List Assigned Groups for User

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | tenant

var memberEmail = "memberEmail_example"; // String | member_email

var opts = { 
  'type': "type_example", // String | type
  'appid': "appid_example" // String | appid
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.listGroupsOnBehalfOfUsingGET(dataPartitionId, memberEmail, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| tenant | 
 **memberEmail** | **String**| member_email | 
 **type** | **String**| type | [optional] 
 **appid** | **String**| appid | [optional] 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listGroupsUsingGET"></a>
# **listGroupsUsingGET**
> EntitlementGroupResponse listGroupsUsingGET(dataPartitionId)

List Assigned Groups

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | tenant


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.listGroupsUsingGET(dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| tenant | 

### Return type

[**EntitlementGroupResponse**](EntitlementGroupResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="updateGroupUsingPATCH"></a>
# **updateGroupUsingPATCH**
> updateGroupUsingPATCH(dataPartitionId, groupEmail)

Updates Items in Group

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.EntitlementApi();

var dataPartitionId = "dataPartitionId_example"; // String | tenant

var groupEmail = "groupEmail_example"; // String | group_email


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.updateGroupUsingPATCH(dataPartitionId, groupEmail, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| tenant | 
 **groupEmail** | **String**| group_email | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

