import socket
import json
import random  # Asegúrate de importar el módulo random

ID_ESTACION = 1

def generar_valores(datos):
    # Definir los rangos para cada variable
    rangos = {
        "voltaje_1": (10.0, 12.0),
        "voltaje_2": (10.0, 12.0),
        "voltaje_3": (10.0, 12.0),
        "voltaje_4": (100.0, 140.0),
        "voltaje_5": (10.0, 12.0),
        "intensidad_1": (16.0, 30.0),
        "intensidad_2": (16.0, 30.0),
        "temperatura_1": (25.0, 45.0),
    }
    
    # Actualizar los valores en el diccionario
    for key in rangos:
        datos[key] = round(random.uniform(*rangos[key]), 2)  # Genera valores flotantes con 2 decimales
    
    return datos

def cliente():
    datos = {
        "id_estacion": ID_ESTACION,
        "voltaje_1": 0.0,
        "voltaje_2": 0.0,
        "voltaje_3": 0.0,
        "voltaje_4": 0.0,
        "voltaje_5": 0.0,
        "intensidad_1": 0.0,
        "intensidad_2": 0.0,
        "temperatura_1": 0.0
    }
    
    datos = generar_valores(datos)
    print("Diccionario de datos:", datos)  # Aquí ya está bien indentado
    
    mensaje = json.dumps(datos)
    
    cliente_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente_socket.connect(('192.168.0.101', 8080))
    print("Conectado al servidor en el puerto 8080")
    
    cliente_socket.send(mensaje.encode('utf-8'))
    cliente_socket.close()

if __name__ == "__main__":
    cliente()
