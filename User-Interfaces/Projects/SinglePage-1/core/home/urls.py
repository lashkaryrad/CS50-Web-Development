from django.urls import path 
from . import views
# Create your models here.

urlpatterns = [
    path('', views.index, name='index'),
    path('section/<int:num>/', views.section, name='section'),
    #Get num for posting to local API 
    #and getting Content in /section/num
]
