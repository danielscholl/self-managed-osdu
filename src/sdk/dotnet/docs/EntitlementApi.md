# OsduClient.Api.EntitlementApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddMemberUsingPOST**](EntitlementApi.md#addmemberusingpost) | **POST** /api/entitlements/v2/groups/{group_email}/members | Add Member to Group
[**CreateGroupUsingPOST**](EntitlementApi.md#creategroupusingpost) | **POST** /api/entitlements/v2/groups | Create a Group
[**DeleteGroupUsingDELETE**](EntitlementApi.md#deletegroupusingdelete) | **DELETE** /api/entitlements/v2/groups/{group_email} | Delete a Group
[**DeleteMemberUsingDELETE**](EntitlementApi.md#deletememberusingdelete) | **DELETE** /api/entitlements/v2/members/{member_email} | Delete a User
[**DeleteMemberUsingDELETE1**](EntitlementApi.md#deletememberusingdelete1) | **DELETE** /api/entitlements/v2/groups/{group_email}/members/{member_email} | Remove Member from Group
[**ListGroupMembersUsingGET**](EntitlementApi.md#listgroupmembersusingget) | **GET** /api/entitlements/v2/groups/{group_email}/members | List Group Members
[**ListGroupsOnBehalfOfUsingGET**](EntitlementApi.md#listgroupsonbehalfofusingget) | **GET** /api/entitlements/v2/members/{member_email}/groups | List Assigned Groups for User
[**ListGroupsUsingGET**](EntitlementApi.md#listgroupsusingget) | **GET** /api/entitlements/v2/groups | List Assigned Groups
[**UpdateGroupUsingPATCH**](EntitlementApi.md#updategroupusingpatch) | **PATCH** /api/entitlements/v2/groups/{group_email} | Updates Items in Group


<a name="addmemberusingpost"></a>
# **AddMemberUsingPOST**
> EntitlementMemberDto AddMemberUsingPOST (string dataPartitionId, string groupEmail, EntitlementMemberDto partitionInfo)

Add Member to Group

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class AddMemberUsingPOSTExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | Partition Name
            var groupEmail = groupEmail_example;  // string | group_email
            var partitionInfo = new EntitlementMemberDto(); // EntitlementMemberDto | partitionInfo

            try
            {
                // Add Member to Group
                EntitlementMemberDto result = apiInstance.AddMemberUsingPOST(dataPartitionId, groupEmail, partitionInfo);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.AddMemberUsingPOST: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Partition Name | 
 **groupEmail** | **string**| group_email | 
 **partitionInfo** | [**EntitlementMemberDto**](EntitlementMemberDto.md)| partitionInfo | 

### Return type

[**EntitlementMemberDto**](EntitlementMemberDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="creategroupusingpost"></a>
# **CreateGroupUsingPOST**
> void CreateGroupUsingPOST (string dataPartitionId)

Create a Group

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class CreateGroupUsingPOSTExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | Partition Id

            try
            {
                // Create a Group
                apiInstance.CreateGroupUsingPOST(dataPartitionId);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.CreateGroupUsingPOST: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Partition Id | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deletegroupusingdelete"></a>
# **DeleteGroupUsingDELETE**
> void DeleteGroupUsingDELETE (string dataPartitionId, string groupEmail)

Delete a Group

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteGroupUsingDELETEExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | tenant
            var groupEmail = groupEmail_example;  // string | group_email

            try
            {
                // Delete a Group
                apiInstance.DeleteGroupUsingDELETE(dataPartitionId, groupEmail);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.DeleteGroupUsingDELETE: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| tenant | 
 **groupEmail** | **string**| group_email | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deletememberusingdelete"></a>
# **DeleteMemberUsingDELETE**
> void DeleteMemberUsingDELETE (string dataPartitionId, string memberEmail)

Delete a User

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteMemberUsingDELETEExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | Data Partition Id
            var memberEmail = memberEmail_example;  // string | member_email

            try
            {
                // Delete a User
                apiInstance.DeleteMemberUsingDELETE(dataPartitionId, memberEmail);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.DeleteMemberUsingDELETE: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Data Partition Id | 
 **memberEmail** | **string**| member_email | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deletememberusingdelete1"></a>
# **DeleteMemberUsingDELETE1**
> string DeleteMemberUsingDELETE1 (string dataPartitionId, string groupEmail, string memberEmail)

Remove Member from Group

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class DeleteMemberUsingDELETE1Example
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | Data Partition Id
            var groupEmail = groupEmail_example;  // string | group_email
            var memberEmail = memberEmail_example;  // string | member_email

            try
            {
                // Remove Member from Group
                string result = apiInstance.DeleteMemberUsingDELETE1(dataPartitionId, groupEmail, memberEmail);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.DeleteMemberUsingDELETE1: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Data Partition Id | 
 **groupEmail** | **string**| group_email | 
 **memberEmail** | **string**| member_email | 

### Return type

**string**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="listgroupmembersusingget"></a>
# **ListGroupMembersUsingGET**
> void ListGroupMembersUsingGET (string dataPartitionId, string groupEmail, string role = null, bool? includeType = null)

List Group Members

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class ListGroupMembersUsingGETExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | Data Partition Id
            var groupEmail = groupEmail_example;  // string | group_email
            var role = role_example;  // string | role (optional) 
            var includeType = true;  // bool? | includeType (optional) 

            try
            {
                // List Group Members
                apiInstance.ListGroupMembersUsingGET(dataPartitionId, groupEmail, role, includeType);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.ListGroupMembersUsingGET: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Data Partition Id | 
 **groupEmail** | **string**| group_email | 
 **role** | **string**| role | [optional] 
 **includeType** | **bool?**| includeType | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="listgroupsonbehalfofusingget"></a>
# **ListGroupsOnBehalfOfUsingGET**
> void ListGroupsOnBehalfOfUsingGET (string dataPartitionId, string memberEmail, string type = null, string appid = null)

List Assigned Groups for User

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class ListGroupsOnBehalfOfUsingGETExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | tenant
            var memberEmail = memberEmail_example;  // string | member_email
            var type = type_example;  // string | type (optional) 
            var appid = appid_example;  // string | appid (optional) 

            try
            {
                // List Assigned Groups for User
                apiInstance.ListGroupsOnBehalfOfUsingGET(dataPartitionId, memberEmail, type, appid);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.ListGroupsOnBehalfOfUsingGET: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| tenant | 
 **memberEmail** | **string**| member_email | 
 **type** | **string**| type | [optional] 
 **appid** | **string**| appid | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="listgroupsusingget"></a>
# **ListGroupsUsingGET**
> EntitlementGroupResponse ListGroupsUsingGET (string dataPartitionId)

List Assigned Groups

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class ListGroupsUsingGETExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | tenant

            try
            {
                // List Assigned Groups
                EntitlementGroupResponse result = apiInstance.ListGroupsUsingGET(dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.ListGroupsUsingGET: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| tenant | 

### Return type

[**EntitlementGroupResponse**](EntitlementGroupResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="updategroupusingpatch"></a>
# **UpdateGroupUsingPATCH**
> void UpdateGroupUsingPATCH (string dataPartitionId, string groupEmail)

Updates Items in Group

### Example
```csharp
using System;
using System.Diagnostics;
using OsduClient.Api;
using OsduClient.Client;
using OsduClient.Model;

namespace Example
{
    public class UpdateGroupUsingPATCHExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new EntitlementApi();
            var dataPartitionId = dataPartitionId_example;  // string | tenant
            var groupEmail = groupEmail_example;  // string | group_email

            try
            {
                // Updates Items in Group
                apiInstance.UpdateGroupUsingPATCH(dataPartitionId, groupEmail);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling EntitlementApi.UpdateGroupUsingPATCH: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| tenant | 
 **groupEmail** | **string**| group_email | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

