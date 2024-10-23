import socket
import threading
import json
import mysql.connector

def manejar_cliente(cliente_socket, direccion_cliente):
    print(f"Saludos desde la dirección {direccion_cliente[0]}")
    mensaje = cliente_socket.recv(1024).decode('utf-8')
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
    
    # Diccionario para mapear los tipos de datos
    tipos_datos = {
        "voltaje_1": 1,
        "voltaje_2": 2,
        "voltaje_3": 3,
        "voltaje_4": 4,
        "voltaje_5": 5,
        "intensidad_1": 6,
        "intensidad_2": 7,
        "temperatura_1": 8
    }
    
    # Insertar los datos en la base de datos
    for key, tipo_id in tipos_datos.items():
        valor = datos[key]
        estacion_id = datos["id_estacion"]
        query = "INSERT INTO mediciones (tipo_id, valor, estacion_id) VALUES (%s, %s, %s)"
        cursor.execute(query, (tipo_id, valor, estacion_id))
    
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
