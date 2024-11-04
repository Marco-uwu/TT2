from django.db import models

class Estacion(models.Model):
    nombre = models.CharField(max_length=100, null=True, blank=True)
    ubicacion = models.CharField(max_length=255, null=True, blank=True)
    estado = models.CharField(max_length=20, choices=[
        ('Disponible', 'Disponible'),
        ('No disponible', 'No disponible'),
        ('Fuera de servicio', 'Fuera de servicio')
    ], default='Fuera de servicio')

    class Meta:
        db_table = 'estaciones'


class Medicion(models.Model):
    tipo = models.CharField(max_length=50, null=True, blank=True, default='N/A')
    valor = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
    tipo_medicion = models.CharField(max_length=3, choices=[
        ('V', 'Voltaje'),
        ('I', 'Intensidad'),
        ('T', 'Temperatura'),
        ('N/A', 'No Aplica')
    ], default='N/A')
    hora = models.DateTimeField(auto_now_add=True)
    estacion = models.ForeignKey(Estacion, on_delete=models.CASCADE, null=True, blank=True)

    class Meta:
        db_table = 'mediciones'

