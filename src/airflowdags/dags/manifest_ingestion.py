"""Temporary DAG for tests."""
import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator

default_args = {
    "start_date": airflow.utils.dates.days_ago(0),
}

with DAG(
    "manifest_ingestion",
    default_args=default_args,
    description="The DAG is used for testing Workflow service, it does nothing but returns "
                "OK status only to Workflow service.",
    schedule_interval=None
) as dag:
    t1 = BashOperator(task_id="echo", bash_command="echo test")
