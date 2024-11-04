# sensores/models.py
from django.db import models

class SensorData(models.Model):
    voltaje1 = models.FloatField()
    voltaje2 = models.FloatField()
    voltaje3 = models.FloatField()
    voltaje4 = models.FloatField()
    voltaje5 = models.FloatField()
    intensidad1 = models.FloatField()
    intensidad2 = models.FloatField()
    temperatura = models.FloatField()
    hora = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Sensor Data {self.id} - {self.hora}"