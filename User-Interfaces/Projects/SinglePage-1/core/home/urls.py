from django.urls import path 
from . import views
# Create your models here.

urlpatterns = [
    path('', views.index, name='index'),
]
