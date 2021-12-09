# SelfManagedOsdu.PartitionApi

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
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.PartitionApi();

var partitionId = "partitionId_example"; // String | partitionId

var partitionInfo = new SelfManagedOsdu.PartitionDto(); // PartitionDto | partitionInfo


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.createUsingPOST(partitionId, partitionInfo, callback);
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
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.PartitionApi();

var partitionId = "partitionId_example"; // String | partitionId


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteUsingDELETE(partitionId, callback);
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
> {'String': PartitionProperty} getUsingGET(partitionId)

Get Single Partition

By passing in a partition Id, you can retrieve the partition information. 

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.PartitionApi();

var partitionId = "partitionId_example"; // String | partitionId


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getUsingGET(partitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partitionId** | **String**| partitionId | 

### Return type

[**{'String': PartitionProperty}**](PartitionProperty.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listUsingGET"></a>
# **listUsingGET**
> ['String'] listUsingGET()

List Partitions

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.PartitionApi();

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.listUsingGET(callback);
```

### Parameters
This endpoint does not need any parameter.

### Return type

**['String']**

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
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.PartitionApi();

var partitionId = "partitionId_example"; // String | partitionId

var partitionInfo = new SelfManagedOsdu.PartitionDto(); // PartitionDto | partitionInfo


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.updateUsingPATCH(partitionId, partitionInfo, callback);
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

