# swagger_client.RegisterApi

All URIs are relative to *https://self-managed-osdu.westeurope.cloudapp.azure.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_a_ddms_registration**](RegisterApi.md#create_a_ddms_registration) | **POST** /api/register/v1/ddms | Create a DDMS registration
[**create_a_subscription**](RegisterApi.md#create_a_subscription) | **POST** /api/register/v1/subscription | Create a subscription
[**create_an_action_registration**](RegisterApi.md#create_an_action_registration) | **POST** /api/register/v1/action | Create an action registration
[**delete_a_ddms_registration**](RegisterApi.md#delete_a_ddms_registration) | **DELETE** /api/register/v1/ddms/{id} | Delete a DDMS registration
[**delete_a_subscription_by_id**](RegisterApi.md#delete_a_subscription_by_id) | **DELETE** /api/register/v1/subscription/{id} | Delete a subscription
[**delete_an_action_registration**](RegisterApi.md#delete_an_action_registration) | **DELETE** /api/register/v1/action/{id} | Delete an action  registration
[**get_a_ddms_registration**](RegisterApi.md#get_a_ddms_registration) | **GET** /api/register/v1/ddms/{id} | Get a DDMS registration
[**get_a_subscription_by_id**](RegisterApi.md#get_a_subscription_by_id) | **GET** /api/register/v1/subscription/{id} | Get a subscription
[**get_an_action_registration**](RegisterApi.md#get_an_action_registration) | **GET** /api/register/v1/action/{id} | Get an action registration
[**list_all_topics**](RegisterApi.md#list_all_topics) | **GET** /api/register/v1/topics | List all topics
[**query_a_ddms_registration**](RegisterApi.md#query_a_ddms_registration) | **GET** /api/register/v1/ddms | Query for DDMS registrations
[**retrieve_an_action_registration**](RegisterApi.md#retrieve_an_action_registration) | **POST** /api/register/v1/action:retrieve | Query for action registrations and substitutes any action with the given parameters
[**test_an_action_registration**](RegisterApi.md#test_an_action_registration) | **POST** /api/register/v1/action:test | Test an action registration
[**update_secret_for_subscription**](RegisterApi.md#update_secret_for_subscription) | **PUT** /api/register/v1/subscription/{id}/secret | Update secret for subscription


# **create_a_ddms_registration**
> RegisterDdms create_a_ddms_registration(data_partition_id, body=body)

Create a DDMS registration

Create a DDMS registration using an OpenApi spec V3 document. Required roles: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.
body = swagger_client.RegisterDdms() # RegisterDdms |  (optional)

try:
    # Create a DDMS registration
    api_response = api_instance.create_a_ddms_registration(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->create_a_ddms_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterDdms**](RegisterDdms.md)|  | [optional] 

### Return type

[**RegisterDdms**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_a_subscription**
> RegisterSubscriptionCreateResult create_a_subscription(data_partition_id, body=body)

Create a subscription

Create a subscription. Required roles: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.
body = swagger_client.RegisterSubscription() # RegisterSubscription |  (optional)

try:
    # Create a subscription
    api_response = api_instance.create_a_subscription(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->create_a_subscription: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterSubscription**](RegisterSubscription.md)|  | [optional] 

### Return type

[**RegisterSubscriptionCreateResult**](RegisterSubscriptionCreateResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_an_action_registration**
> RegisterAction create_an_action_registration(data_partition_id, body=body)

Create an action registration

Create an action registration. Required role: 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.
body = swagger_client.RegisterCreateAction() # RegisterCreateAction |  (optional)

try:
    # Create an action registration
    api_response = api_instance.create_an_action_registration(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->create_an_action_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterCreateAction**](RegisterCreateAction.md)|  | [optional] 

### Return type

[**RegisterAction**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_a_ddms_registration**
> delete_a_ddms_registration(id, data_partition_id)

Delete a DDMS registration

Delete a DDMS registration with the given id. Required roles: 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # Delete a DDMS registration
    api_instance.delete_a_ddms_registration(id, data_partition_id)
except ApiException as e:
    print("Exception when calling RegisterApi->delete_a_ddms_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_a_subscription_by_id**
> delete_a_subscription_by_id(id, data_partition_id)

Delete a subscription

Delete a subscription with its Id. Required role: 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # Delete a subscription
    api_instance.delete_a_subscription_by_id(id, data_partition_id)
except ApiException as e:
    print("Exception when calling RegisterApi->delete_a_subscription_by_id: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_an_action_registration**
> delete_an_action_registration(id, data_partition_id)

Delete an action  registration

Delete an action registration with the given id. Required role: 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # Delete an action  registration
    api_instance.delete_an_action_registration(id, data_partition_id)
except ApiException as e:
    print("Exception when calling RegisterApi->delete_an_action_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_a_ddms_registration**
> RegisterDdms get_a_ddms_registration(id, data_partition_id)

Get a DDMS registration

Get a DDMS registration with the given id. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # Get a DDMS registration
    api_response = api_instance.get_a_ddms_registration(id, data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->get_a_ddms_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterDdms**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_a_subscription_by_id**
> RegisterGetSubscriptionResult get_a_subscription_by_id(id, data_partition_id)

Get a subscription

Get a subscription with its Id. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # Get a subscription
    api_response = api_instance.get_a_subscription_by_id(id, data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->get_a_subscription_by_id: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterGetSubscriptionResult**](RegisterGetSubscriptionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_an_action_registration**
> RegisterAction get_an_action_registration(id, data_partition_id)

Get an action registration

Get an action registration with the given id. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # Get an action registration
    api_response = api_instance.get_an_action_registration(id, data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->get_an_action_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**RegisterAction**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_all_topics**
> list[RegisterTopic] list_all_topics(data_partition_id)

List all topics

List all topics that you can create a subscription for, along with the corresponding sample messages. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # List all topics
    api_response = api_instance.list_all_topics(data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->list_all_topics: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**list[RegisterTopic]**](RegisterTopic.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **query_a_ddms_registration**
> list[RegisterDdms] query_a_ddms_registration(type, data_partition_id)

Query for DDMS registrations

Query for DDMS registrations allowing retrievals by type. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
type = 'type_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.

try:
    # Query for DDMS registrations
    api_response = api_instance.query_a_ddms_registration(type, data_partition_id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->query_a_ddms_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 

### Return type

[**list[RegisterDdms]**](RegisterDdms.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **retrieve_an_action_registration**
> list[RegisterAction] retrieve_an_action_registration(data_partition_id, body=body)

Query for action registrations and substitutes any action with the given parameters

Retrieve an action registration. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
data_partition_id = 'opendes' # str | Specifies the partition to use. This should be either the partition name associated with the partition. (default to opendes)
body = swagger_client.RegisterRecord() # RegisterRecord | The Record to find matching actions for and apply the template for. (optional)

try:
    # Query for action registrations and substitutes any action with the given parameters
    api_response = api_instance.retrieve_an_action_registration(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->retrieve_an_action_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | [default to opendes]
 **body** | [**RegisterRecord**](RegisterRecord.md)| The Record to find matching actions for and apply the template for. | [optional] 

### Return type

[**list[RegisterAction]**](RegisterAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **test_an_action_registration**
> RegisterTestActionResult test_an_action_registration(data_partition_id, body=body)

Test an action registration

Test an action registration. Required roles: 'users.datalake.viewers' or 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.
body = swagger_client.RegisterTestAction() # RegisterTestAction |  (optional)

try:
    # Test an action registration
    api_response = api_instance.test_an_action_registration(data_partition_id, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RegisterApi->test_an_action_registration: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterTestAction**](RegisterTestAction.md)|  | [optional] 

### Return type

[**RegisterTestActionResult**](RegisterTestActionResult.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_secret_for_subscription**
> update_secret_for_subscription(id, data_partition_id, body=body)

Update secret for subscription

Update secret for a subscription. Required role: 'users.datalake.editors' or 'users.datalake.admins'

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure API key authorization: Bearer
configuration = swagger_client.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = swagger_client.RegisterApi(swagger_client.ApiClient(configuration))
id = 'id_example' # str | 
data_partition_id = 'data_partition_id_example' # str | Specifies the partition to use. This should be either the partition name associated with the partition.
body = swagger_client.RegisterSecret() # RegisterSecret |  (optional)

try:
    # Update secret for subscription
    api_instance.update_secret_for_subscription(id, data_partition_id, body=body)
except ApiException as e:
    print("Exception when calling RegisterApi->update_secret_for_subscription: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  | 
 **data_partition_id** | **str**| Specifies the partition to use. This should be either the partition name associated with the partition. | 
 **body** | [**RegisterSecret**](RegisterSecret.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

