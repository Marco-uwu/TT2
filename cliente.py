import socket
import json

def cliente():
    datos = {
        "voltaje1": 0.0,
        "voltaje2": 0.0,
        "voltaje3": 0.0,
        "voltaje4": 0.0,
        "voltaje5": 0.0,
        "intensidad1": 0.0,
        "intensidad2": 0.0,
        "temperatura1": 0.0
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
