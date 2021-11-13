from django.urls import path
from api.views import default
from api.views import register

urlpatterns  = [
    path('hello/', default.hello),
    path('', default.index),
    path('register/', register.register)
]

