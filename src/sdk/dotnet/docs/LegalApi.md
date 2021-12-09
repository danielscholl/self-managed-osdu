# IO.Swagger.Api.LegalApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**CreateLegalTag**](LegalApi.md#createlegaltag) | **POST** /api/legal/v1/legaltags | Creates the LegalTag for the given &#39;name&#39;.
[**DeleteLegalTag**](LegalApi.md#deletelegaltag) | **DELETE** /api/legal/v1/legaltags/{name} | Delete Legal Tag
[**GetLegalTag**](LegalApi.md#getlegaltag) | **GET** /api/legal/v1/legaltags/{name} | Gets a LegalTag for the given &#39;name&#39;.
[**GetLegalTagProperties**](LegalApi.md#getlegaltagproperties) | **GET** /api/legal/v1/legaltags:properties | Gets LegalTag property values.
[**GetLegalTags**](LegalApi.md#getlegaltags) | **POST** /api/legal/v1/legaltags:batchRetrieve | Retrieves the LegalTags for the given names.
[**ListLegalTags**](LegalApi.md#listlegaltags) | **GET** /api/legal/v1/legaltags | Gets all LegalTags.
[**UpdateLegalTag**](LegalApi.md#updatelegaltag) | **PUT** /api/legal/v1/legaltags | Updates the LegalTag for the given &#39;name&#39;.
[**ValidateLegalTags**](LegalApi.md#validatelegaltags) | **POST** /api/legal/v1/legaltags:validate | Retrieves the invalid LegalTag names with reasons for the given names.


<a name="createlegaltag"></a>
# **CreateLegalTag**
> LegalTagDto CreateLegalTag (string oSDUAccountId, LegalTagDto body = null, string oSDUOnBehalfOf = null)

Creates the LegalTag for the given 'name'.

This allows for the creation of your LegalTag. There can only be 1 LegalTag per 'name'. A LegalTag must be created before you can start ingesting data for that name.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class CreateLegalTagExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Users account e.g. OSDU
            var body = new LegalTagDto(); // LegalTagDto |  (optional) 
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | User's email or auth token (optional) 

            try
            {
                // Creates the LegalTag for the given 'name'.
                LegalTagDto result = apiInstance.CreateLegalTag(oSDUAccountId, body, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.CreateLegalTag: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Users account e.g. OSDU | 
 **body** | [**LegalTagDto**](LegalTagDto.md)|  | [optional] 
 **oSDUOnBehalfOf** | **string**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="deletelegaltag"></a>
# **DeleteLegalTag**
> void DeleteLegalTag (string dataPartitionId, string name)

Delete Legal Tag

This allows for the deletion of your LegalTag using the 'name' associated with it. 

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class DeleteLegalTagExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var dataPartitionId = dataPartitionId_example;  // string | Partition Id
            var name = name_example;  // string | 

            try
            {
                // Delete Legal Tag
                apiInstance.DeleteLegalTag(dataPartitionId, name);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.DeleteLegalTag: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Partition Id | 
 **name** | **string**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getlegaltag"></a>
# **GetLegalTag**
> LegalTagDto GetLegalTag (string dataPartitionId, string name)

Gets a LegalTag for the given 'name'.

This allows for the retrieval of your LegalTag using the 'name' associated with it.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class GetLegalTagExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var dataPartitionId = dataPartitionId_example;  // string | Partition Id
            var name = name_example;  // string | 

            try
            {
                // Gets a LegalTag for the given 'name'.
                LegalTagDto result = apiInstance.GetLegalTag(dataPartitionId, name);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.GetLegalTag: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **string**| Partition Id | 
 **name** | **string**|  | 

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getlegaltagproperties"></a>
# **GetLegalTagProperties**
> LegalTagPropertyValues GetLegalTagProperties (string dataPartitionId)

Gets LegalTag property values.

This allows for the retrieval of allowed values for LegalTag properties.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class GetLegalTagPropertiesExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var dataPartitionId = dataPartitionId_example;  // string | Partition Id

            try
            {
                // Gets LegalTag property values.
                LegalTagPropertyValues result = apiInstance.GetLegalTagProperties(dataPartitionId);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.GetLegalTagProperties: " + e.Message );
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

[**LegalTagPropertyValues**](LegalTagPropertyValues.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="getlegaltags"></a>
# **GetLegalTags**
> LegalTagDtos GetLegalTags (string oSDUAccountId, LegalTagRequest body = null, string oSDUOnBehalfOf = null)

Retrieves the LegalTags for the given names.

This allows for the retrieval of your LegalTags using the 'name' associated with it. A maximum of 25 can be retrieved at once.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class GetLegalTagsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Users account e.g. OSDU
            var body = new LegalTagRequest(); // LegalTagRequest |  (optional) 
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | User's email or auth token (optional) 

            try
            {
                // Retrieves the LegalTags for the given names.
                LegalTagDtos result = apiInstance.GetLegalTags(oSDUAccountId, body, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.GetLegalTags: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Users account e.g. OSDU | 
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional] 
 **oSDUOnBehalfOf** | **string**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="listlegaltags"></a>
# **ListLegalTags**
> LegalTagDtos ListLegalTags (string oSDUAccountId, bool? valid = null, string oSDUOnBehalfOf = null)

Gets all LegalTags.

This allows for the retrieval of all LegalTags.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class ListLegalTagsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Users account e.g. OSDU
            var valid = true;  // bool? | If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true. (optional)  (default to true)
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | User's email or auth token (optional) 

            try
            {
                // Gets all LegalTags.
                LegalTagDtos result = apiInstance.ListLegalTags(oSDUAccountId, valid, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.ListLegalTags: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Users account e.g. OSDU | 
 **valid** | **bool?**| If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true. | [optional] [default to true]
 **oSDUOnBehalfOf** | **string**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="updatelegaltag"></a>
# **UpdateLegalTag**
> LegalTagDto UpdateLegalTag (string oSDUAccountId, LegalTagUpdateDto body = null, string oSDUOnBehalfOf = null)

Updates the LegalTag for the given 'name'.

This allows to update certain properties of your LegalTag using the 'name' associated with it.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class UpdateLegalTagExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Users account e.g. OSDU
            var body = new LegalTagUpdateDto(); // LegalTagUpdateDto |  (optional) 
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | User's email or auth token (optional) 

            try
            {
                // Updates the LegalTag for the given 'name'.
                LegalTagDto result = apiInstance.UpdateLegalTag(oSDUAccountId, body, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.UpdateLegalTag: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Users account e.g. OSDU | 
 **body** | [**LegalTagUpdateDto**](LegalTagUpdateDto.md)|  | [optional] 
 **oSDUOnBehalfOf** | **string**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a name="validatelegaltags"></a>
# **ValidateLegalTags**
> LegalTagInvalidResponseList ValidateLegalTags (string oSDUAccountId, LegalTagRequest body = null, string oSDUOnBehalfOf = null)

Retrieves the invalid LegalTag names with reasons for the given names.

This allows for the retrieval of the reason why your LegalTag is not valid. A maximum of 25 can be retrieved at once.

### Example
```csharp
using System;
using System.Diagnostics;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace Example
{
    public class ValidateLegalTagsExample
    {
        public void main()
        {
            // Configure API key authorization: Bearer
            Configuration.Default.AddApiKey("Authorization", "YOUR_API_KEY");
            // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
            // Configuration.Default.AddApiKeyPrefix("Authorization", "Bearer");

            var apiInstance = new LegalApi();
            var oSDUAccountId = oSDUAccountId_example;  // string | Users account e.g. OSDU
            var body = new LegalTagRequest(); // LegalTagRequest |  (optional) 
            var oSDUOnBehalfOf = oSDUOnBehalfOf_example;  // string | User's email or auth token (optional) 

            try
            {
                // Retrieves the invalid LegalTag names with reasons for the given names.
                LegalTagInvalidResponseList result = apiInstance.ValidateLegalTags(oSDUAccountId, body, oSDUOnBehalfOf);
                Debug.WriteLine(result);
            }
            catch (Exception e)
            {
                Debug.Print("Exception when calling LegalApi.ValidateLegalTags: " + e.Message );
            }
        }
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **string**| Users account e.g. OSDU | 
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional] 
 **oSDUOnBehalfOf** | **string**| User&#39;s email or auth token | [optional] 

### Return type

[**LegalTagInvalidResponseList**](LegalTagInvalidResponseList.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

