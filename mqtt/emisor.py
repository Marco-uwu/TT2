import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

import paho.mqtt.client as mqtt
import time
import uuid

from claseEstacion import Estacion

# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    print(f"Mensaje recibido: {msg.payload.decode()} en el tema {msg.topic}")

# Función de callback cuando el cliente se desconecta
def on_disconnect(client, userdata, rc):
    if rc == 0:
        print("Desconexión del cliente MQTT")
    else:
        print("Desconexión inesperada del cliente MQTT")

# Función para enviar un mensaje
def enviar_mensaje(client, topic, mensaje):
    client.publish(topic, mensaje)

# Obtener la dirección MAC
def obtener_mac():
    mac_address = ':'.join(['{:02x}'.format((uuid.getnode() >> elements) & 0xff) for elements in range(0, 8 * 6, 8)][::-1])
    mac_address = mac_address.upper();
    return mac_address

# Crear una instancia del cliente MQTT
client = mqtt.Client()
client.on_message = on_message
client.on_disconnect = on_disconnect

# Conectar al servidor MQTT
client.connect("192.168.0.101", 1883, 60)
client.subscribe("estaciones/estacion_1/alertas")

try:
    mac_address = obtener_mac()
    estacion = Estacion("64:5D:86:1D:D1:7B")
    # Publicar un mensaje cada 5 segundos
    while True:
        mensaje = estacion.to_bytearray()
        enviar_mensaje(client, "estaciones/estacion_1", mensaje)
        print(estacion)
        client.loop_start()
        time.sleep(2)
except KeyboardInterrupt:
    print("Interrupción del teclado recibida, cerrando el cliente MQTT.")
    client.disconnect()
    client.loop_stop()  
