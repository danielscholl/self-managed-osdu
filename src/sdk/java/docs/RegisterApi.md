# RegisterApi

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
> RegisterDdms createADDMSRegistration(dataPartitionId, body)

Create a DDMS registration

Create a DDMS registration using an OpenApi spec V3 document. Required roles: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
RegisterDdms body = new RegisterDdms(); // RegisterDdms | 
try {
    RegisterDdms result = apiInstance.createADDMSRegistration(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#createADDMSRegistration");
    e.printStackTrace();
}
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
> RegisterSubscriptionCreateResult createASubscription(dataPartitionId, body)

Create a subscription

Create a subscription. Required roles: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
RegisterSubscription body = new RegisterSubscription(); // RegisterSubscription | 
try {
    RegisterSubscriptionCreateResult result = apiInstance.createASubscription(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#createASubscription");
    e.printStackTrace();
}
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
> RegisterAction createAnActionRegistration(dataPartitionId, body)

Create an action registration

Create an action registration. Required role: &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
RegisterCreateAction body = new RegisterCreateAction(); // RegisterCreateAction | 
try {
    RegisterAction result = apiInstance.createAnActionRegistration(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#createAnActionRegistration");
    e.printStackTrace();
}
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

Delete a DDMS registration with the given id. Required roles: &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String id = "id_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    apiInstance.deleteADDMSRegistration(id, dataPartitionId);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#deleteADDMSRegistration");
    e.printStackTrace();
}
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

Delete a subscription with its Id. Required role: &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String id = "id_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    apiInstance.deleteASubscriptionById(id, dataPartitionId);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#deleteASubscriptionById");
    e.printStackTrace();
}
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

Delete an action registration with the given id. Required role: &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String id = "id_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    apiInstance.deleteAnActionRegistration(id, dataPartitionId);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#deleteAnActionRegistration");
    e.printStackTrace();
}
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

Get a DDMS registration with the given id. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String id = "id_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    RegisterDdms result = apiInstance.getADDMSRegistration(id, dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#getADDMSRegistration");
    e.printStackTrace();
}
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

Get a subscription with its Id. Required role: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String id = "id_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    RegisterGetSubscriptionResult result = apiInstance.getASubscriptionById(id, dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#getASubscriptionById");
    e.printStackTrace();
}
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

Get an action registration with the given id. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String id = "id_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    RegisterAction result = apiInstance.getAnActionRegistration(id, dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#getAnActionRegistration");
    e.printStackTrace();
}
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
> List&lt;RegisterTopic&gt; listAllTopics(dataPartitionId)

List all topics

List all topics that you can create a subscription for, along with the corresponding sample messages. Required role: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    List<RegisterTopic> result = apiInstance.listAllTopics(dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#listAllTopics");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. |

### Return type

[**List&lt;RegisterTopic&gt;**](RegisterTopic.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="queryADDMSRegistration"></a>
# **queryADDMSRegistration**
> List&lt;RegisterDdms&gt; queryADDMSRegistration(type, dataPartitionId)

Query for DDMS registrations

Query for DDMS registrations allowing retrievals by type. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String type = "type_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
try {
    List<RegisterDdms> result = apiInstance.queryADDMSRegistration(type, dataPartitionId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#queryADDMSRegistration");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  |
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. |

### Return type

[**List&lt;RegisterDdms&gt;**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="retrieveAnActionRegistration"></a>
# **retrieveAnActionRegistration**
> List&lt;RegisterAction&gt; retrieveAnActionRegistration(dataPartitionId, body)

Query for action registrations and substitutes any action with the given parameters

Retrieve an action registration. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String dataPartitionId = "opendes"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
RegisterRecord body = new RegisterRecord(); // RegisterRecord | The Record to find matching actions for and apply the template for.
try {
    List<RegisterAction> result = apiInstance.retrieveAnActionRegistration(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#retrieveAnActionRegistration");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataPartitionId** | **String**| Specifies the partition to use. This should be either the partition name associated with the partition. | [default to opendes]
 **body** | [**RegisterRecord**](RegisterRecord.md)| The Record to find matching actions for and apply the template for. | [optional]

### Return type

[**List&lt;RegisterAction&gt;**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="testAnActionRegistration"></a>
# **testAnActionRegistration**
> RegisterTestActionResult testAnActionRegistration(dataPartitionId, body)

Test an action registration

Test an action registration. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
RegisterTestAction body = new RegisterTestAction(); // RegisterTestAction | 
try {
    RegisterTestActionResult result = apiInstance.testAnActionRegistration(dataPartitionId, body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#testAnActionRegistration");
    e.printStackTrace();
}
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
> updateSecretForSubscription(id, dataPartitionId, body)

Update secret for subscription

Update secret for a subscription. Required role: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;

### Example
```java
// Import classes:
//import osdu.client.ApiClient;
//import osdu.client.ApiException;
//import osdu.client.Configuration;
//import osdu.client.auth.*;
//import osdu.client.api.RegisterApi;

ApiClient defaultClient = Configuration.getDefaultApiClient();

// Configure API key authorization: Bearer
ApiKeyAuth Bearer = (ApiKeyAuth) defaultClient.getAuthentication("Bearer");
Bearer.setApiKey("YOUR API KEY");
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//Bearer.setApiKeyPrefix("Token");

RegisterApi apiInstance = new RegisterApi();
String id = "id_example"; // String | 
String dataPartitionId = "dataPartitionId_example"; // String | Specifies the partition to use. This should be either the partition name associated with the partition.
RegisterSecret body = new RegisterSecret(); // RegisterSecret | 
try {
    apiInstance.updateSecretForSubscription(id, dataPartitionId, body);
} catch (ApiException e) {
    System.err.println("Exception when calling RegisterApi#updateSecretForSubscription");
    e.printStackTrace();
}
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

