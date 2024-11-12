from django.urls import path
from . import views

urlpatterns = [
    path('inicio/', views.inicio, name='inicio'),
    path('inicio/mediciones/', views.lista_mediciones, name='lista_mediciones'),
]
