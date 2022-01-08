# SelfManagedOsdu.RegisterApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createADDMSRegistration**](RegisterApi.md#createADDMSRegistration) | **POST** /api/register/v1/ddms | Create a DDMS registration
[**createASubscription**](RegisterApi.md#createASubscription) | **POST** /api/register/v1/subscription | Create a subscription
[**createAnActionRegistration**](RegisterApi.md#createAnActionRegistration) | **POST** /api/register/v1/action | Create an action registration
[**deleteADDMSRegistration**](RegisterApi.md#deleteADDMSRegistration) | **DELETE** /api/register/v1/ddms/{id} | Delete a DDMS registration
[**deleteASubscriptionById**](RegisterApi.md#deleteASubscriptionById) | **DELETE** /api/register/v1/subscription/{id} | Delete a subscription
[**deleteAnActionRegistration**](RegisterApi.md#deleteAnActionRegistration) | **DELETE** /api/register/v1/action/{id} | Delete an action  registration
[**getADDMSRegistration**](RegisterApi.md#getADDMSRegistration) | **GET** /api/register/v1/ddms/{id} | Get a DDMS registration
[**getASubscriptionById**](RegisterApi.md#getASubscriptionById) | **GET** /api/register/v1/subscription/{id} | Get a subscription
[**getAnActionRegistration**](RegisterApi.md#getAnActionRegistration) | **GET** /api/register/v1/action/{id} | Get an action registration
[**listAllTopics**](RegisterApi.md#listAllTopics) | **GET** /api/register/v1/topics | List all topics
[**queryADDMSRegistration**](RegisterApi.md#queryADDMSRegistration) | **GET** /api/register/v1/ddms | Query for DDMS registrations
[**retrieveAnActionRegistration**](RegisterApi.md#retrieveAnActionRegistration) | **POST** /api/register/v1/action:retrieve | Query for action registrations and substitutes any action with the given parameters
[**testAnActionRegistration**](RegisterApi.md#testAnActionRegistration) | **POST** /api/register/v1/action:test | Test an action registration
[**updateSecretForSubscription**](RegisterApi.md#updateSecretForSubscription) | **PUT** /api/register/v1/subscription/{id}/secret | Update secret for subscription


<a name="createADDMSRegistration"></a>
# **createADDMSRegistration**
> RegisterDdms createADDMSRegistration(dataPartitionId, opts)

Create a DDMS registration

Create a DDMS registration using an OpenApi spec V3 document. Required roles: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.RegisterDdms() // RegisterDdms | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.createADDMSRegistration(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterDdms**](RegisterDdms.md)|  | [optional] 

### Return type

[**RegisterDdms**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="createASubscription"></a>
# **createASubscription**
> RegisterSubscriptionCreateResult createASubscription(dataPartitionId, opts)

Create a subscription

Create a subscription. Required roles: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.RegisterSubscription() // RegisterSubscription | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.createASubscription(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterSubscription**](RegisterSubscription.md)|  | [optional] 

### Return type

[**RegisterSubscriptionCreateResult**](RegisterSubscriptionCreateResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="createAnActionRegistration"></a>
# **createAnActionRegistration**
> RegisterAction createAnActionRegistration(dataPartitionId, opts)

Create an action registration

Create an action registration. Required role: 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.RegisterCreateAction() // RegisterCreateAction | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.createAnActionRegistration(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterCreateAction**](RegisterCreateAction.md)|  | [optional] 

### Return type

[**RegisterAction**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteADDMSRegistration"></a>
# **deleteADDMSRegistration**
> deleteADDMSRegistration(id, dataPartitionId)

Delete a DDMS registration

Delete a DDMS registration with the given id. Required roles: 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var id = "id_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteADDMSRegistration(id, dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteASubscriptionById"></a>
# **deleteASubscriptionById**
> deleteASubscriptionById(id, dataPartitionId)

Delete a subscription

Delete a subscription with its Id. Required role: 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var id = "id_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteASubscriptionById(id, dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteAnActionRegistration"></a>
# **deleteAnActionRegistration**
> deleteAnActionRegistration(id, dataPartitionId)

Delete an action  registration

Delete an action registration with the given id. Required role: 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var id = "id_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.deleteAnActionRegistration(id, dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getADDMSRegistration"></a>
# **getADDMSRegistration**
> RegisterDdms getADDMSRegistration(id, dataPartitionId)

Get a DDMS registration

Get a DDMS registration with the given id. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var id = "id_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getADDMSRegistration(id, dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterDdms**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getASubscriptionById"></a>
# **getASubscriptionById**
> RegisterGetSubscriptionResult getASubscriptionById(id, dataPartitionId)

Get a subscription

Get a subscription with its Id. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var id = "id_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getASubscriptionById(id, dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterGetSubscriptionResult**](RegisterGetSubscriptionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="getAnActionRegistration"></a>
# **getAnActionRegistration**
> RegisterAction getAnActionRegistration(id, dataPartitionId)

Get an action registration

Get an action registration with the given id. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var id = "id_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.getAnActionRegistration(id, dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterAction**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="listAllTopics"></a>
# **listAllTopics**
> [RegisterTopic] listAllTopics(dataPartitionId)

List all topics

List all topics that you can create a subscription for, along with the corresponding sample messages. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.listAllTopics(dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**[RegisterTopic]**](RegisterTopic.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="queryADDMSRegistration"></a>
# **queryADDMSRegistration**
> [RegisterDdms] queryADDMSRegistration(type, dataPartitionId)

Query for DDMS registrations

Query for DDMS registrations allowing retrievals by type. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var type = "type_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.


var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.queryADDMSRegistration(type, dataPartitionId, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**[RegisterDdms]**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="retrieveAnActionRegistration"></a>
# **retrieveAnActionRegistration**
> [RegisterAction] retrieveAnActionRegistration(dataPartitionId, opts)

Query for action registrations and substitutes any action with the given parameters

Retrieve an action registration. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var dataPartitionId = "opendes"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.RegisterRecord() // RegisterRecord | The Record to find matching actions for and apply the template for.
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.retrieveAnActionRegistration(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | [default to opendes]
 **body** | [**RegisterRecord**](RegisterRecord.md)| The Record to find matching actions for and apply the template for. | [optional] 

### Return type

[**[RegisterAction]**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="testAnActionRegistration"></a>
# **testAnActionRegistration**
> RegisterTestActionResult testAnActionRegistration(dataPartitionId, opts)

Test an action registration

Test an action registration. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.RegisterTestAction() // RegisterTestAction | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
};
apiInstance.testAnActionRegistration(dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterTestAction**](RegisterTestAction.md)|  | [optional] 

### Return type

[**RegisterTestActionResult**](RegisterTestActionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="updateSecretForSubscription"></a>
# **updateSecretForSubscription**
> updateSecretForSubscription(id, dataPartitionId, opts)

Update secret for subscription

Update secret for a subscription. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```javascript
var SelfManagedOsdu = require('self_managed_osdu');
var defaultClient = SelfManagedOsdu.ApiClient.instance;

// Configure API key authorization: Bearer
var Bearer = defaultClient.authentications['Bearer'];
Bearer.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.apiKeyPrefix = 'Token';

var apiInstance = new SelfManagedOsdu.RegisterApi();

var id = "id_example"; // String | 

var dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.

var opts = { 
  'body': new SelfManagedOsdu.RegisterSecret() // RegisterSecret | 
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
};
apiInstance.updateSecretForSubscription(id, dataPartitionId, opts, callback);
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterSecret**](RegisterSecret.md)|  | [optional] 

### Return type

null (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

