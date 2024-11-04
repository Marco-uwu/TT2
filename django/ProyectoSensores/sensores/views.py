# sensores/views.py
from django.shortcuts import render
from .models import SensorData

def mostrar_tabla(request):
    datos = SensorData.objects.all()
    return render(request, 'sensores/tabla.html', {'datos': datos})