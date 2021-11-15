from typing import List
from oep_api.clients.storage.oep_storage_client import OepStorageClient
from oep_api.clients.search.oep_search_client import OepSearchClient
from oep_api.model.search.query_request import QueryRequest
from requests.api import request
def create_record(token=None):
    storage_client = OepStorageClient()

    return storage_client.create_or_update_records()

def get_latest_record(id : str, attributes : List[str], token=None):
    storage_client = OepStorageClient()
    return storage_client.get_latest_record_version(id, attributes, bearer_token=token)


def delete_record(id : str, token : str = None):
    storage_client = OepStorageClient()
    return storage_client.delete_record(id, bearer_token=token)

def search_record(kind: str, query : str = None, token : str = None):
    search_client = OepSearchClient()
    request = QueryRequest(kind=kind, limit=1, offset=0, query=query)
    search_client.search(request=request, bearer_token=token)