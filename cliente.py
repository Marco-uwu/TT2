import socket
import json
import random
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import os
from claseEstacion import Estacion

ID_ESTACION = 1

def solicitar_clave_publica():
    cliente_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente_socket.connect(('192.168.0.101', 8080))
    cliente_socket.send("SOLICITAR_CLAVE_PUBLICA".encode('utf-8'))
    clave_publica = cliente_socket.recv(4096)
    cliente_socket.close()
    return serialization.load_pem_public_key(clave_publica, backend=default_backend())

def cifrar_mensaje(mensaje, public_key):
    # Generar una clave AES aleatoria
    clave_aes = os.urandom(32)
    
    # Cifrar el mensaje con AES
    iv = os.urandom(16)
    cipher = Cipher(algorithms.AES(clave_aes), modes.CFB(iv), backend=default_backend())
    encryptor = cipher.encryptor()
    mensaje_cifrado = encryptor.update(mensaje.encode('utf-8')) + encryptor.finalize()
    
    # Cifrar la clave AES con RSA
    clave_aes_cifrada = public_key.encrypt(
        clave_aes,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    
    return iv + clave_aes_cifrada + mensaje_cifrado

def cliente():
    estacion = Estacion(id_estacion=ID_ESTACION)
    estacion.simular_valores()
    print(estacion.__dict__)
    
    mensaje = json.dumps(estacion.__dict__)
    
    # Solicitar clave pública del servidor
    public_key = solicitar_clave_publica()
    
    # Cifrar el mensaje
    mensaje_cifrado = cifrar_mensaje(mensaje, public_key)
    
    cliente_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente_socket.connect(('192.168.0.101', 8080))
    print("Conectado al servidor en el puerto 8080")
    
    cliente_socket.send(mensaje_cifrado)
    cliente_socket.close()

if __name__ == "__main__":
    cliente()
