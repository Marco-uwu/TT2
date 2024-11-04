from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render
from .models import Estacion, Medicion

def inicio(request):
    estaciones = Estacion.objects.all()[:5]
    return render(request, 'inicio.html', {'estaciones': estaciones})

def lista_mediciones(request):
    mediciones = Medicion.objects.all()
    return render(request, 'mediciones.html', {'mediciones': mediciones})
