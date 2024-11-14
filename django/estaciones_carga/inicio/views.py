from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from .models import Estaciones, ParametrosMedicion

def inicio(request):
    estaciones = Estaciones.objects.all().values()
    parametros = ParametrosMedicion.objects.filter(id_regla=1)
    template = loader.get_template('inicio.html')
    context = {
        'estaciones' : estaciones,
        'parametros' : parametros,
    }
    return HttpResponse(template.render(context, request))
