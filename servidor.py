import socket
import threading
import json

def manejar_cliente(cliente_socket, direccion_cliente):
    print(f"Saludos desde la dirección {direccion_cliente[0]}")
    mensaje = cliente_socket.recv(1024).decode('utf-8')
    datos = json.loads(mensaje)
    print("Datos recibidos:", datos)
    cliente_socket.close()

def iniciar_servidor():
    servidor = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    servidor.bind(('0.0.0.0', 8080))
    servidor.listen(5)
    print("Servidor escuchando en el puerto 8080...")

    while True:
        cliente_socket, direccion_cliente = servidor.accept()
        hilo_cliente = threading.Thread(target=manejar_cliente, args=(cliente_socket, direccion_cliente))
        hilo_cliente.start()

if __name__ == "__main__":
    iniciar_servidor()