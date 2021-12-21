# SearchCursorQueryRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cursor** | **str** | The cursor value returned from a previous query. | [optional] 
**kind** | **str** | The kind of the record to query e.g. &#39;tenant1:test:well:1.0.0&#39;. | 
**limit** | **int** | The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000. | [optional] 
**query** | **str** | The query string in Lucene query string syntax. | [optional] 
**spatial_filter** | [**SearchSpatialFilter**](SearchSpatialFilter.md) |  | [optional] 
**returned_fields** | **list[str]** | The fields on which to project the results. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


