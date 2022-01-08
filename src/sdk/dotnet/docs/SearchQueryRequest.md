# OsduClient.Model.SearchQueryRequest
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Offset** | **int?** | The starting offset from which to return results | [optional] 
**Kind** | **string** | The kind of the record to query e.g. &#39;tenant1:test:well:1.0.0&#39;. | 
**Limit** | **int?** | The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000. | [optional] 
**Query** | **string** | The query string in Lucene query string syntax. | [optional] 
**SpatialFilter** | [**SearchSpatialFilter**](SearchSpatialFilter.md) |  | [optional] 
**ReturnedFields** | **List&lt;string&gt;** | The fields on which to project the results. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

