from django.urls import path
from api import views


urlpatterns  = [
    path('hello/', views.hello),
    path('', views.index),
]