import random
import struct

class Estacion:
    def __init__(self, dir_mac, voltaje_1=0.0, voltaje_2=0.0, voltaje_3=0.0, voltaje_4=0.0, voltaje_5=0.0, intensidad_1=0.0, intensidad_2=0.0, temperatura=0.0):
        self.dir_mac = dir_mac
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
        self.voltaje_1 = round(random.uniform(10.0, 12.0), 2)
        self.voltaje_2 = round(random.uniform(10.0, 12.0), 2)
        self.voltaje_3 = round(random.uniform(10.0, 12.0), 2)
        self.voltaje_4 = round(random.uniform(100.0, 140.0), 2)
        self.voltaje_5 = round(random.uniform(10.0, 12.0), 2)
        self.intensidad_1 = round(random.uniform(16.0, 30.0), 2)
        self.intensidad_2 = round(random.uniform(16.0, 30.0), 2)
        self.temperatura = round(random.uniform(25.0, 45.0), 2)


    def to_bytearray(self):
        return struct.pack(
            '16s 20s 20s 20s 20s 20s 20s 20s 20s', 
            self.dir_mac.encode('utf-8'), 
            str(self.voltaje_1).encode('utf-8'), 
            str(self.voltaje_2).encode('utf-8'), 
            str(self.voltaje_3).encode('utf-8'), 
            str(self.voltaje_4).encode('utf-8'), 
            str(self.voltaje_5).encode('utf-8'), 
            str(self.intensidad_1).encode('utf-8'), 
            str(self.intensidad_2).encode('utf-8'), 
            str(self.temperatura).encode('utf-8')
        )

    @classmethod
    def from_bytearray(cls, data):
        unpacked_data = struct.unpack('16s 20s 20s 20s 20s 20s 20s 20s 20s', data)
        dir_mac = unpacked_data[0].decode('utf-8').strip('\x00')
        return cls(
            dir_mac,
            float(unpacked_data[1].decode('utf-8').strip('\x00')),
            float(unpacked_data[2].decode('utf-8').strip('\x00')),
            float(unpacked_data[3].decode('utf-8').strip('\x00')),
            float(unpacked_data[4].decode('utf-8').strip('\x00')),
            float(unpacked_data[5].decode('utf-8').strip('\x00')),
            float(unpacked_data[6].decode('utf-8').strip('\x00')),
            float(unpacked_data[7].decode('utf-8').strip('\x00')),
            float(unpacked_data[8].decode('utf-8').strip('\x00'))
        )
    
    def __str__(self):
        return (f"Estacion(dir_mac={self.dir_mac}, voltaje_1={self.voltaje_1}, voltaje_2={self.voltaje_2}, "
                f"voltaje_3={self.voltaje_3}, voltaje_4={self.voltaje_4}, voltaje_5={self.voltaje_5}, "
                f"intensidad_1={self.intensidad_1}, intensidad_2={self.intensidad_2}, temperatura={self.temperatura})")

    def obtener_mediciones(self):
        arreglo = [self.voltaje_1, self.voltaje_2, self.voltaje_3, self.voltaje_4, self.voltaje_5, self.intensidad_1, self.intensidad_2, self.temperatura]
        return arreglo