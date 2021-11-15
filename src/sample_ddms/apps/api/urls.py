from django.urls import path
from api.views import default
from api.views import register

urlpatterns  = [
    path('sampleddms/hello/', default.hello),
    path('sampleddms/', default.index),
    path('sampleddms/register/', register.register)
]

