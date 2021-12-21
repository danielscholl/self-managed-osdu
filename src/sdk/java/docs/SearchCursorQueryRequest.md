
# SearchCursorQueryRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cursor** | **String** | The cursor value returned from a previous query. |  [optional]
**kind** | **String** | The kind of the record to query e.g. &#39;tenant1:test:well:1.0.0&#39;. | 
**limit** | **Integer** | The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000. |  [optional]
**query** | **String** | The query string in Lucene query string syntax. |  [optional]
**spatialFilter** | [**SearchSpatialFilter**](SearchSpatialFilter.md) |  |  [optional]
**returnedFields** | **List&lt;String&gt;** | The fields on which to project the results. |  [optional]



