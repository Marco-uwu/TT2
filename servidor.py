import socket
import threading
import json
import mysql.connector
import subprocess
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

# Ejecutar el script para generar claves
subprocess.run(["python3", "generar_claves.py"])

def cargar_clave_privada():
    with open("private_key.pem", "rb") as f:
        return serialization.load_pem_private_key(f.read(), password=None, backend=default_backend())

def cargar_clave_publica():
    with open("public_key.pem", "rb") as f:
        return f.read()

def descifrar_mensaje(mensaje_cifrado, private_key):
    # Extraer el IV, la clave AES cifrada y el mensaje cifrado
    iv = mensaje_cifrado[:16]
    clave_aes_cifrada = mensaje_cifrado[16:16+256]
    mensaje_cifrado = mensaje_cifrado[16+256:]
    
    # Descifrar la clave AES con RSA
    clave_aes = private_key.decrypt(
        clave_aes_cifrada,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    
    # Descifrar el mensaje con AES
    cipher = Cipher(algorithms.AES(clave_aes), modes.CFB(iv), backend=default_backend())
    decryptor = cipher.decryptor()
    mensaje = decryptor.update(mensaje_cifrado) + decryptor.finalize()
    
    return mensaje.decode('utf-8')

def manejar_cliente(cliente_socket, direccion_cliente):
    print(f"Saludos desde la dirección {direccion_cliente[0]}")
    solicitud = cliente_socket.recv(4096)
    
    try:
        solicitud_decodificada = solicitud.decode('utf-8')
        if solicitud_decodificada == "SOLICITAR_CLAVE_PUBLICA":
            clave_publica = cargar_clave_publica()
            cliente_socket.send(clave_publica)
        else:
            raise ValueError("Solicitud no reconocida")
    except UnicodeDecodeError:
        # Asumir que es un mensaje cifrado
        mensaje_cifrado = solicitud
        
        # Cargar clave privada
        private_key = cargar_clave_privada()
        
        # Descifrar el mensaje
        mensaje = descifrar_mensaje(mensaje_cifrado, private_key)
        
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
