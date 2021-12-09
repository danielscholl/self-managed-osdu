# SelfManagedOsdu.LegalApi

All URIs are relative to *https://oak-osdu-dplbhggc-mwt3-gw.westeurope.cloudapp.azure.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createLegalTag**](LegalApi.md#createLegalTag) | **POST** /legal/v1/legaltags | Creates the LegalTag for the given 'name'.
[**deleteLegalTag**](LegalApi.md#deleteLegalTag) | **DELETE** /legal/v1/legaltags/{name} | Delete Legal Tag
[**getLegalTag**](LegalApi.md#getLegalTag) | **GET** /legal/v1/legaltags/{name} | Gets a LegalTag for the given 'name'.
[**getLegalTagProperties**](LegalApi.md#getLegalTagProperties) | **GET** /legal/v1/legaltags:properties | Gets LegalTag property values.
[**getLegalTags**](LegalApi.md#getLegalTags) | **POST** /legal/v1/legaltags:batchRetrieve | Retrieves the LegalTags for the given names.
[**listLegalTags**](LegalApi.md#listLegalTags) | **GET** /legal/v1/legaltags | Gets all LegalTags.
[**updateLegalTag**](LegalApi.md#updateLegalTag) | **PUT** /legal/v1/legaltags | Updates the LegalTag for the given 'name'.
[**validateLegalTags**](LegalApi.md#validateLegalTags) | **POST** /legal/v1/legaltags:validate | Retrieves the invalid LegalTag names with reasons for the given names.


<a name="createLegalTag"></a>
# **createLegalTag**
> LegalTagDto createLegalTag(oSDUAccountId, opts)

Creates the LegalTag for the given 'name'.

This allows for the creation of your LegalTag. There can only be 1 LegalTag per 'name'. A LegalTag must be created before you can start ingesting data for that name.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Users account e.g. OSDU

var opts = { 
  'body': new SelfManagedOsdu.LegalTagDto(), // LegalTagDto | 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | User's email or auth token
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.createLegalTag(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Users account e.g. OSDU | 
 **body** | [**LegalTagDto**](LegalTagDto.md)|  | [optional] 
 **oSDUOnBehalfOf** | **String**| User's email or auth token | [optional] 

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

This allows for the deletion of your LegalTag using the 'name' associated with it. 

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var dataPartitionId = "dataPartitionId_example"; // String | Partition Id

var name = "name_example"; // String | 


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteLegalTag(dataPartitionId, name, callback);
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

Gets a LegalTag for the given 'name'.

This allows for the retrieval of your LegalTag using the 'name' associated with it.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var dataPartitionId = "dataPartitionId_example"; // String | Partition Id

var name = "name_example"; // String | 


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getLegalTag(dataPartitionId, name, callback);
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
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var dataPartitionId = "dataPartitionId_example"; // String | Partition Id


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getLegalTagProperties(dataPartitionId, callback);
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
> LegalTagDtos getLegalTags(oSDUAccountId, opts)

Retrieves the LegalTags for the given names.

This allows for the retrieval of your LegalTags using the 'name' associated with it. A maximum of 25 can be retrieved at once.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Users account e.g. OSDU

var opts = { 
  'body': new SelfManagedOsdu.LegalTagRequest(), // LegalTagRequest | 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | User's email or auth token
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getLegalTags(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Users account e.g. OSDU | 
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional] 
 **oSDUOnBehalfOf** | **String**| User's email or auth token | [optional] 

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listLegalTags"></a>
# **listLegalTags**
> LegalTagDtos listLegalTags(oSDUAccountId, opts)

Gets all LegalTags.

This allows for the retrieval of all LegalTags.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Users account e.g. OSDU

var opts = { 
  'valid': true, // Boolean | If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true.
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | User's email or auth token
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.listLegalTags(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Users account e.g. OSDU | 
 **valid** | **Boolean**| If true returns only valid LegalTags, if false returns only invalid LegalTags.  Default value is true. | [optional] [default to true]
 **oSDUOnBehalfOf** | **String**| User's email or auth token | [optional] 

### Return type

[**LegalTagDtos**](LegalTagDtos.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="updateLegalTag"></a>
# **updateLegalTag**
> LegalTagDto updateLegalTag(oSDUAccountId, opts)

Updates the LegalTag for the given 'name'.

This allows to update certain properties of your LegalTag using the 'name' associated with it.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Users account e.g. OSDU

var opts = { 
  'body': new SelfManagedOsdu.LegalTagUpdateDto(), // LegalTagUpdateDto | 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | User's email or auth token
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.updateLegalTag(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Users account e.g. OSDU | 
 **body** | [**LegalTagUpdateDto**](LegalTagUpdateDto.md)|  | [optional] 
 **oSDUOnBehalfOf** | **String**| User's email or auth token | [optional] 

### Return type

[**LegalTagDto**](LegalTagDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="validateLegalTags"></a>
# **validateLegalTags**
> LegalTagInvalidResponseList validateLegalTags(oSDUAccountId, opts)

Retrieves the invalid LegalTag names with reasons for the given names.

This allows for the retrieval of the reason why your LegalTag is not valid. A maximum of 25 can be retrieved at once.

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.LegalApi();

var oSDUAccountId = "oSDUAccountId_example"; // String | Users account e.g. OSDU

var opts = { 
  'body': new SelfManagedOsdu.LegalTagRequest(), // LegalTagRequest | 
  'oSDUOnBehalfOf': "oSDUOnBehalfOf_example" // String | User's email or auth token
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.validateLegalTags(oSDUAccountId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oSDUAccountId** | **String**| Users account e.g. OSDU | 
 **body** | [**LegalTagRequest**](LegalTagRequest.md)|  | [optional] 
 **oSDUOnBehalfOf** | **String**| User's email or auth token | [optional] 

### Return type

[**LegalTagInvalidResponseList**](LegalTagInvalidResponseList.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

