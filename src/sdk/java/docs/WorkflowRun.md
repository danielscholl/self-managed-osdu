
# WorkflowRun

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workflowId** | **String** | Workflow id for the workflow. |  [optional]
**runId** | **String** | Run id for the workflow. |  [optional]
**startTimestamp** | [**BigDecimal**](BigDecimal.md) | Start timestamp of the workflow run.Epoch time stamp. |  [optional]
**endTimestamp** | [**BigDecimal**](BigDecimal.md) | End timestamp of the workflow run.Epoch timestamp. |  [optional]
**status** | [**StatusEnum**](#StatusEnum) | Task execution status |  [optional]
**submittedBy** | **String** | System captured user details which triggered the  run. |  [optional]


<a name="StatusEnum"></a>
## Enum: StatusEnum
Name | Value
---- | -----
INPROGRESS | &quot;INPROGRESS&quot;
PARTIAL_SUCCESS | &quot;PARTIAL_SUCCESS&quot;
SUCCESS | &quot;SUCCESS&quot;
FAILED | &quot;FAILED&quot;
SUBMITTED | &quot;SUBMITTED&quot;



