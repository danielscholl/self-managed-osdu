import json
from typing import NamedTuple
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from main.settings import env 
from main.settings import BASE_DIR
from oep_api.clients.register.oep_register_ddms_client import OepRegisterDdmsClient
from oep_api.model.register.ddms import Ddms
from oep_api.clients.schema.oep_schema_client import OepSchemaClient
from oep_api.model.schema.schema_request import SchemaRequset


def register(token=None):
    spec_path = '{}/api/schemas/api_specification-{}.json'.format(BASE_DIR, env('REG_API_SPEC_VERSION'))
    reg_client = OepRegisterDdmsClient()
    with open(spec_path) as f:
        data = json.load(f)
        d = Ddms(**data)
        d.id = env('DDMS_ID')
        api_spec = d

        reg_client.post_ddms(spec=api_spec, bearer_token=token)
    schema_path = '{}/api/schemas/schema.json'.format(BASE_DIR)
    schema_client = OepSchemaClient()
    with open(schema_path) as f:
        data = json.load(f)
        schema = SchemaRequset(**data)
        schema_client.create_schema(schema_request=schema, bearer_token=token)

    return JsonResponse({'view': 'register'}, status=200)
