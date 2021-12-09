# LegalApi

All URIs are relative to *https://oak-osdu-dplbhggc-mwt3-gw.westeurope.cloudapp.azure.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createLegalTag**](LegalApi.md#createLegalTag) | **POST** /legal/v1/legaltags | Creates the LegalTag for the given &#39;name&#39;.
[**deleteLegalTag**](LegalApi.md#deleteLegalTag) | **DELETE** /legal/v1/legaltags/{name} | Delete Legal Tag
[**getLegalTag**](LegalApi.md#getLegalTag) | **GET** /legal/v1/legaltags/{name} | Gets a LegalTag for the given &#39;name&#39;.
[**getLegalTagProperties**](LegalApi.md#getLegalTagProperties) | **GET** /legal/v1/legaltags:properties | Gets LegalTag property values.
[**getLegalTags**](LegalApi.md#getLegalTags) | **POST** /legal/v1/legaltags:batchRetrieve | Retrieves the LegalTags for the given names.
[**listLegalTags**](LegalApi.md#listLegalTags) | **GET** /legal/v1/legaltags | Gets all LegalTags.
[**updateLegalTag**](LegalApi.md#updateLegalTag) | **PUT** /legal/v1/legaltags | Updates the LegalTag for the given &#39;name&#39;.
[**validateLegalTags**](LegalApi.md#validateLegalTags) | **POST** /legal/v1/legaltags:validate | Retrieves the invalid LegalTag names with reasons for the given names.


<a name="createLegalTag"></a>
# **createLegalTag**
> LegalTagDto createLegalTag(osDUAccountId, body, osDUOnBehalfOf)

Creates the LegalTag for the given &#39;name&#39;.

This allows for the creation of your LegalTag. There can only be 1 LegalTag per &#39;name&#39;. A LegalTag must be created before you can start ingesting data for that name.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String osDUAccountId = "osDUAccountId_example"; // String | Users account e.g. OSDU
LegalTagDto body = new LegalTagDto(); // LegalTagDto | 
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | User's email or auth token
try {
    LegalTagDto result = apiInstance.createLegalTag(osDUAccountId, body, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#createLegalTag");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Users account e.g. OSDU |
 **body** | [**LegalTagDto**](LegalTagDto.md)|  | [optional]
 **osDUOnBehalfOf** | **String**| User&#39;s email or auth token | [optional]

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteLegalTag"></a>
# **deleteLegalTag**
> deleteLegalTag(dataPartitionId, name)

Delete Legal Tag

This allows for the deletion of your LegalTag using the &#39;name&#39; associated with it. 

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String dataPartitionId = "dataPartitionId_example"; // String | Partition Id
String name = "name_example"; // String | 
try {
    apiInstance.deleteLegalTag(dataPartitionId, name);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#deleteLegalTag");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Partition Id |
 **name** | **String**|  |

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getLegalTag"></a>
# **getLegalTag**
> LegalTagDto getLegalTag(dataPartitionId, name)

Gets a LegalTag for the given &#39;name&#39;.

This allows for the retrieval of your LegalTag using the &#39;name&#39; associated with it.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String dataPartitionId = "dataPartitionId_example"; // String | Partition Id
String name = "name_example"; // String | 
try {
    LegalTagDto result = apiInstance.getLegalTag(dataPartitionId, name);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#getLegalTag");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Partition Id |
 **name** | **String**|  |

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getLegalTagProperties"></a>
# **getLegalTagProperties**
> LegalTagPropertyValues getLegalTagProperties(dataPartitionId)

Gets LegalTag property values.

This allows for the retrieval of allowed values for LegalTag properties.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String dataPartitionId = "dataPartitionId_example"; // String | Partition Id
try {
    LegalTagPropertyValues result = apiInstance.getLegalTagProperties(dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#getLegalTagProperties");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Partition Id |

### Return type

[**LegalTagPropertyValues**](LegalTagPropertyValues.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getLegalTags"></a>
# **getLegalTags**
> LegalTagDtos getLegalTags(osDUAccountId, body, osDUOnBehalfOf)

Retrieves the LegalTags for the given names.

This allows for the retrieval of your LegalTags using the &#39;name&#39; associated with it. A maximum of 25 can be retrieved at once.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String osDUAccountId = "osDUAccountId_example"; // String | Users account e.g. OSDU
LegalTagRequest body = new LegalTagRequest(); // LegalTagRequest | 
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | User's email or auth token
try {
    LegalTagDtos result = apiInstance.getLegalTags(osDUAccountId, body, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#getLegalTags");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Users account e.g. OSDU |
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional]
 **osDUOnBehalfOf** | **String**| User&#39;s email or auth token | [optional]

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listLegalTags"></a>
# **listLegalTags**
> LegalTagDtos listLegalTags(osDUAccountId, valid, osDUOnBehalfOf)

Gets all LegalTags.

This allows for the retrieval of all LegalTags.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String osDUAccountId = "osDUAccountId_example"; // String | Users account e.g. OSDU
Boolean valid = true; // Boolean | If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true.
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | User's email or auth token
try {
    LegalTagDtos result = apiInstance.listLegalTags(osDUAccountId, valid, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#listLegalTags");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Users account e.g. OSDU |
 **valid** | **Boolean**| If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true. | [optional] [default to true]
 **osDUOnBehalfOf** | **String**| User&#39;s email or auth token | [optional]

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="updateLegalTag"></a>
# **updateLegalTag**
> LegalTagDto updateLegalTag(osDUAccountId, body, osDUOnBehalfOf)

Updates the LegalTag for the given &#39;name&#39;.

This allows to update certain properties of your LegalTag using the &#39;name&#39; associated with it.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String osDUAccountId = "osDUAccountId_example"; // String | Users account e.g. OSDU
LegalTagUpdateDto body = new LegalTagUpdateDto(); // LegalTagUpdateDto | 
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | User's email or auth token
try {
    LegalTagDto result = apiInstance.updateLegalTag(osDUAccountId, body, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#updateLegalTag");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Users account e.g. OSDU |
 **body** | [**LegalTagUpdateDto**](LegalTagUpdateDto.md)|  | [optional]
 **osDUOnBehalfOf** | **String**| User&#39;s email or auth token | [optional]

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="validateLegalTags"></a>
# **validateLegalTags**
> LegalTagInvalidResponseList validateLegalTags(osDUAccountId, body, osDUOnBehalfOf)

Retrieves the invalid LegalTag names with reasons for the given names.

This allows for the retrieval of the reason why your LegalTag is not valid. A maximum of 25 can be retrieved at once.

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.LegalApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

LegalApi apiInstance = new LegalApi();
String osDUAccountId = "osDUAccountId_example"; // String | Users account e.g. OSDU
LegalTagRequest body = new LegalTagRequest(); // LegalTagRequest | 
String osDUOnBehalfOf = "osDUOnBehalfOf_example"; // String | User's email or auth token
try {
    LegalTagInvalidResponseList result = apiInstance.validateLegalTags(osDUAccountId, body, osDUOnBehalfOf);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling LegalApi#validateLegalTags");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **osDUAccountId** | **String**| Users account e.g. OSDU |
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional]
 **osDUOnBehalfOf** | **String**| User&#39;s email or auth token | [optional]

### Return type

[**LegalTagInvalidResponseList**](LegalTagInvalidResponseList.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

