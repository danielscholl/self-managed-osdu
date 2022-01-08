# Workflow

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workflow_id** | **str** | System generated id, which uniquely recongnizes a workflow. | [optional] 
**workflow_name** | **str** | Workfow name given as input from user while deploying the workflow. | [optional] 
**registration_instructions** | **object** | Workfow registration instructions which could contains: - Name of already registered Airflow DAG - Cotent of python DAG file - etc By default this is Airflow DAG named &#x60;workflowName&#x60;  | [optional] 
**description** | **str** | Description of workflow provided by user at time of creation of workflow. | [optional] 
**createdby** | **str** | System captured user info who created workflow. | [optional] 
**creation_timestamp** | **float** | System date of creation of workflow.Epoch tiemstamp. | [optional] 
**version** | **str** | Sematic versions of workflow. These numbers are assigned in increasing order and correspond to edits\\modifications to workflow definitions. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


