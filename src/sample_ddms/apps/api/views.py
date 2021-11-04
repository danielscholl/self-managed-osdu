from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser

@csrf_exempt
def hello(request):
    return JsonResponse({'hello': 'world'}, status=200)

def index(request):
    return JsonResponse({'Application': "Sample DDMS"}, status=200)
