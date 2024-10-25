import random

class Estacion:
    def __init__(self, id_estacion, voltaje_1=0.0, voltaje_2=0.0, voltaje_3=0.0, voltaje_4=0.0, voltaje_5=0.0, intensidad_1=0.0, intensidad_2=0.0, temperatura=0.0):
        self.id_estacion = id_estacion
        self.voltaje_1 = voltaje_1
        self.voltaje_2 = voltaje_2
        self.voltaje_3 = voltaje_3
        self.voltaje_4 = voltaje_4
        self.voltaje_5 = voltaje_5
        self.intensidad_1 = intensidad_1
        self.intensidad_2 = intensidad_2
        self.temperatura = temperatura

    def asignar_valores(self, voltaje_1, voltaje_2, voltaje_3, voltaje_4, voltaje_5, intensidad_1, intensidad_2, temperatura):
        self.voltaje_1 = voltaje_1
        self.voltaje_2 = voltaje_2
        self.voltaje_3 = voltaje_3
        self.voltaje_4 = voltaje_4
        self.voltaje_5 = voltaje_5
        self.intensidad_1 = intensidad_1
        self.intensidad_2 = intensidad_2
        self.temperatura = temperatura

    def simular_valores(self):
        self.voltaje_1 = random.uniform(10.0, 12.0)
        self.voltaje_2 = random.uniform(10.0, 12.0)
        self.voltaje_3 = random.uniform(10.0, 12.0)
        self.voltaje_4 = random.uniform(100.0, 140.0)
        self.voltaje_5 = random.uniform(10.0, 12.0)
        self.intensidad_1 = random.uniform(16.0, 30.0)
        self.intensidad_2 = random.uniform(16.0, 30.0)
        self.temperatura = random.uniform(25.0, 45.0)
