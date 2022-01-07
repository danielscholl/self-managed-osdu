# OsduClient.Model.Workflow
## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**WorkflowId** | **string** | System generated id, which uniquely recongnizes a workflow. | [optional] 
**WorkflowName** | **string** | Workfow name given as input from user while deploying the workflow. | [optional] 
**RegistrationInstructions** | **Object** | Workfow registration instructions which could contains: - Name of already registered Airflow DAG - Cotent of python DAG file - etc By default this is Airflow DAG named &#x60;workflowName&#x60;  | [optional] 
**Description** | **string** | Description of workflow provided by user at time of creation of workflow. | [optional] 
**Createdby** | **string** | System captured user info who created workflow. | [optional] 
**CreationTimestamp** | **decimal?** | System date of creation of workflow.Epoch tiemstamp. | [optional] 
**Version** | **string** | Sematic versions of workflow. These numbers are assigned in increasing order and correspond to edits\\modifications to workflow definitions. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

