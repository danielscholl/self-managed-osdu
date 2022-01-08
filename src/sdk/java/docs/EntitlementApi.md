# EntitlementApi

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
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | Partition Name
String groupEmail = "groupEmail_example"; // String | group_email
EntitlementMemberDto partitionInfo = new EntitlementMemberDto(); // EntitlementMemberDto | partitionInfo
try {
    EntitlementMemberDto result = apiInstance.addMemberUsingPOST(dataPartitionId, groupEmail, partitionInfo);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#addMemberUsingPOST");
    e.printStackTrace();
}
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
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | Partition Id
try {
    apiInstance.createGroupUsingPOST(dataPartitionId);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#createGroupUsingPOST");
    e.printStackTrace();
}
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
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | tenant
String groupEmail = "groupEmail_example"; // String | group_email
try {
    apiInstance.deleteGroupUsingDELETE(dataPartitionId, groupEmail);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#deleteGroupUsingDELETE");
    e.printStackTrace();
}
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
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | Data Partition Id
String memberEmail = "memberEmail_example"; // String | member_email
try {
    apiInstance.deleteMemberUsingDELETE(dataPartitionId, memberEmail);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#deleteMemberUsingDELETE");
    e.printStackTrace();
}
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
> String deleteMemberUsingDELETE1(dataPartitionId, groupEmail, memberEmail)

Remove Member from Group

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | Data Partition Id
String groupEmail = "groupEmail_example"; // String | group_email
String memberEmail = "memberEmail_example"; // String | member_email
try {
    String result = apiInstance.deleteMemberUsingDELETE1(dataPartitionId, groupEmail, memberEmail);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#deleteMemberUsingDELETE1");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Data Partition Id |
 **groupEmail** | **String**| group_email |
 **memberEmail** | **String**| member_email |

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listGroupMembersUsingGET"></a>
# **listGroupMembersUsingGET**
> listGroupMembersUsingGET(dataPartitionId, groupEmail, role, includeType)

List Group Members

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | Data Partition Id
String groupEmail = "groupEmail_example"; // String | group_email
String role = "role_example"; // String | role
Boolean includeType = true; // Boolean | includeType
try {
    apiInstance.listGroupMembersUsingGET(dataPartitionId, groupEmail, role, includeType);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#listGroupMembersUsingGET");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Data Partition Id |
 **groupEmail** | **String**| group_email |
 **role** | **String**| role | [optional] [enum: MEMBER, OWNER]
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
> listGroupsOnBehalfOfUsingGET(dataPartitionId, memberEmail, type, appid)

List Assigned Groups for User

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | tenant
String memberEmail = "memberEmail_example"; // String | member_email
String type = "type_example"; // String | type
String appid = "appid_example"; // String | appid
try {
    apiInstance.listGroupsOnBehalfOfUsingGET(dataPartitionId, memberEmail, type, appid);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#listGroupsOnBehalfOfUsingGET");
    e.printStackTrace();
}
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
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | tenant
try {
    EntitlementGroupResponse result = apiInstance.listGroupsUsingGET(dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#listGroupsUsingGET");
    e.printStackTrace();
}
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
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.EntitlementApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

EntitlementApi apiInstance = new EntitlementApi();
String dataPartitionId = "dataPartitionId_example"; // String | tenant
String groupEmail = "groupEmail_example"; // String | group_email
try {
    apiInstance.updateGroupUsingPATCH(dataPartitionId, groupEmail);
} catch (ApiException e) {
    System.err.println("Exception when calling EntitlementApi#updateGroupUsingPATCH");
    e.printStackTrace();
}
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

