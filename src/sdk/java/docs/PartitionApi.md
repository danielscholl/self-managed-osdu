# PartitionApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUsingPOST**](PartitionApi.md#createUsingPOST) | **POST** /api/partition/v1/partitions/{partitionId} | Create Partition
[**deleteUsingDELETE**](PartitionApi.md#deleteUsingDELETE) | **DELETE** /api/partition/v1/partitions/{partitionId} | Delete Partition
[**getUsingGET**](PartitionApi.md#getUsingGET) | **GET** /api/partition/v1/partitions/{partitionId} | Get Single Partition
[**listUsingGET**](PartitionApi.md#listUsingGET) | **GET** /api/partition/v1/partitions | List Partitions
[**updateUsingPATCH**](PartitionApi.md#updateUsingPATCH) | **PATCH** /api/partition/v1/partitions/{partitionId} | Update Partition


<a name="createUsingPOST"></a>
# **createUsingPOST**
> createUsingPOST(partitionId, partitionInfo)

Create Partition

By passing in a partition Id and a partition info object you can create a partition. 

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.PartitionApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

PartitionApi apiInstance = new PartitionApi();
String partitionId = "partitionId_example"; // String | partitionId
PartitionDto partitionInfo = new PartitionDto(); // PartitionDto | partitionInfo
try {
    apiInstance.createUsingPOST(partitionId, partitionInfo);
} catch (ApiException e) {
    System.err.println("Exception when calling PartitionApi#createUsingPOST");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **String**| partitionId |
 **partitionInfo** | [**PartitionDto**](PartitionDto.md)| partitionInfo |

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteUsingDELETE"></a>
# **deleteUsingDELETE**
> deleteUsingDELETE(partitionId)

Delete Partition

By passing in a single partition Id, you can delete a partition. 

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.PartitionApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

PartitionApi apiInstance = new PartitionApi();
String partitionId = "partitionId_example"; // String | partitionId
try {
    apiInstance.deleteUsingDELETE(partitionId);
} catch (ApiException e) {
    System.err.println("Exception when calling PartitionApi#deleteUsingDELETE");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **String**| partitionId |

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getUsingGET"></a>
# **getUsingGET**
> Map&lt;String, PartitionProperty&gt; getUsingGET(partitionId)

Get Single Partition

By passing in a partition Id, you can retrieve the partition information. 

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.PartitionApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

PartitionApi apiInstance = new PartitionApi();
String partitionId = "partitionId_example"; // String | partitionId
try {
    Map<String, PartitionProperty> result = apiInstance.getUsingGET(partitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PartitionApi#getUsingGET");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **String**| partitionId |

### Return type

[**Map&lt;String, PartitionProperty&gt;**](PartitionProperty.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listUsingGET"></a>
# **listUsingGET**
> List&lt;String&gt; listUsingGET()

List Partitions

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.PartitionApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

PartitionApi apiInstance = new PartitionApi();
try {
    List<String> result = apiInstance.listUsingGET();
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PartitionApi#listUsingGET");
    e.printStackTrace();
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**List&lt;String&gt;**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="updateUsingPATCH"></a>
# **updateUsingPATCH**
> updateUsingPATCH(partitionId, partitionInfo)

Update Partition

By passing in a partition Id and a partition info object you can update a partition. 

### Example
```java
// Import classes:
//import io.swagger.client.ApiClient;
//import io.swagger.client.ApiException;
//import io.swagger.client.Configuration;
//import io.swagger.client.auth.*;
//import io.swagger.client.api.PartitionApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

PartitionApi apiInstance = new PartitionApi();
String partitionId = "partitionId_example"; // String | partitionId
PartitionDto partitionInfo = new PartitionDto(); // PartitionDto | partitionInfo
try {
    apiInstance.updateUsingPATCH(partitionId, partitionInfo);
} catch (ApiException e) {
    System.err.println("Exception when calling PartitionApi#updateUsingPATCH");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **String**| partitionId |
 **partitionInfo** | [**PartitionDto**](PartitionDto.md)| partitionInfo |

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

