# sensores/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.mostrar_tabla, name='mostrar_tabla'),
]