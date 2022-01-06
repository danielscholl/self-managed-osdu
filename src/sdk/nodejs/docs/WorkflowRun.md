# SelfManagedOsdu.WorkflowRun

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workflowId** | **String** | Workflow id for the workflow. | [optional] 
**runId** | **String** | Run id for the workflow. | [optional] 
**startTimestamp** | **Number** | Start timestamp of the workflow run.Epoch time stamp. | [optional] 
**endTimestamp** | **Number** | End timestamp of the workflow run.Epoch timestamp. | [optional] 
**status** | **String** | Task execution status | [optional] 
**submittedBy** | **String** | System captured user details which triggered the  run. | [optional] 


<a name="StatusEnum"></a>
## Enum: StatusEnum


* `INPROGRESS` (value: `"INPROGRESS"`)

* `PARTIAL_SUCCESS` (value: `"PARTIAL_SUCCESS"`)

* `SUCCESS` (value: `"SUCCESS"`)

* `FAILED` (value: `"FAILED"`)

* `SUBMITTED` (value: `"SUBMITTED"`)




