import socket
import json
import random

from claseEstacion import Estacion

ID_ESTACION = 1

def cliente():
    estacion = Estacion(id_estacion = ID_ESTACION)
    estacion.simular_valores()
    print(estacion.__dict__)
    
    mensaje = json.dumps(estacion.__dict__)
    
    cliente_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente_socket.connect(('192.168.0.101', 8080))
    print("Conectado al servidor en el puerto 8080")
    
    cliente_socket.send(mensaje.encode('utf-8'))
    cliente_socket.close()

if __name__ == "__main__":
    cliente()
