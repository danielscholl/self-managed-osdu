
# Workflow

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workflowId** | **String** | System generated id, which uniquely recongnizes a workflow. |  [optional]
**workflowName** | **String** | Workfow name given as input from user while deploying the workflow. |  [optional]
**registrationInstructions** | **Object** | Workfow registration instructions which could contains: - Name of already registered Airflow DAG - Cotent of python DAG file - etc By default this is Airflow DAG named &#x60;workflowName&#x60;  |  [optional]
**description** | **String** | Description of workflow provided by user at time of creation of workflow. |  [optional]
**createdby** | **String** | System captured user info who created workflow. |  [optional]
**creationTimestamp** | [**BigDecimal**](BigDecimal.md) | System date of creation of workflow.Epoch tiemstamp. |  [optional]
**version** | **String** | Sematic versions of workflow. These numbers are assigned in increasing order and correspond to edits\\modifications to workflow definitions. |  [optional]



