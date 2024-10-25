import socket
import threading
import json
import mysql.connector

from claseEstacion import Estacion

def manejar_cliente(cliente_socket, direccion_cliente):
    print(f"Saludos desde la dirección {direccion_cliente[0]}")
    mensaje = cliente_socket.recv(4096).decode('utf-8')
    datos = json.loads(mensaje)
    print("Datos recibidos:", datos)
    
    # Conectar a la base de datos
    conexion = mysql.connector.connect(
        host="localhost",
        user="adminbd",
        password="User-1123456",
        database="estaciones_carga"
    )
    
    cursor = conexion.cursor()
    
    query = """
    INSERT INTO mediciones (voltaje_1, voltaje_2, voltaje_3, voltaje_4, voltaje_5, intensidad_1, intensidad_2, temperatura, estacion_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    valores = (
        datos['voltaje_1'], datos['voltaje_2'], datos['voltaje_3'], datos['voltaje_4'], 
        datos['voltaje_5'], datos['intensidad_1'], datos['intensidad_2'], datos['temperatura'], 
        datos['id_estacion']
    )
    cursor.execute(query, valores)
    
    # Confirmar los cambios
    conexion.commit()
    
    # Cerrar la conexión
    cursor.close()
    conexion.close()
    
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
