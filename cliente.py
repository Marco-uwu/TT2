import socket
import json

ID_ESTACION = 1

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
    
    print("Diccionario de datos:", datos)
    
    mensaje = json.dumps(datos)
    
    cliente_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente_socket.connect(('192.168.0.101', 8080))
    print("Conectado al servidor en el puerto 8080")
    
    cliente_socket.send(mensaje.encode('utf-8'))
    cliente_socket.close()

if __name__ == "__main__":
    cliente()
