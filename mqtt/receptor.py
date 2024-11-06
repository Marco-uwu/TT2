import mysql.connector
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

import paho.mqtt.client as mqtt
import time

from claseEstacion import Estacion

# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    global cursor
    query = """SELECT nombre FROM estaciones WHERE dir_mac = %s"""
    #resultado = cursor.execute(query, )
    resultado = Estacion.from_bytearray(msg.payload)
    print(resultado)

# Función para enviar un mensaje
def enviar_mensaje(client, topic, mensaje):
    client.publish(topic, mensaje)

# Función de callback cuando el cliente se desconecta
def on_disconnect(client, userdata, rc):
    if rc == 0:
        print("Desconexión esperada del cliente MQTT")
    else:
        print("Desconexión inesperada del cliente MQTT")

# Conectar a la base de datos
conexion = mysql.connector.connect(
    host="localhost",
    user="adminbd",
    password="User-1123456",
    database="estaciones_carga"
)
cursor = conexion.cursor()

# Crear una instancia del cliente MQTT
client = mqtt.Client()
client.on_message = on_message
client.on_disconnect = on_disconnect

# Conectar al servidor MQTT (cambia 'localhost' por la dirección de tu servidor si es necesario)
client.connect("localhost", 1883, 60)

# Suscribirse a los temas
client.subscribe("estaciones/+")

try:
    while True:
        client.loop_start()  # Iniciar el bucle para recibir mensajes
        enviar_mensaje(client, "estaciones/estacion_1/alertas", "respuesta")
        time.sleep(2)
except KeyboardInterrupt:
    print("Interrupción del teclado recibida, cerrando el cliente MQTT.")
    client.disconnect()
    client.loop_stop()  # Detener el bucle de mensajes

