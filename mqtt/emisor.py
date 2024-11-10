import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)
import paho.mqtt.client as mqtt
import time
import uuid

from pymongo import MongoClient
from pymongo.errors import PyMongoError
from claseEstacion import Estacion

# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    print(f"Mensaje recibido: {msg.payload.decode()} en el tema {msg.topic}\n")


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
    mac_address = mac_address.upper()
    return mac_address


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Conectar al cliente MongoDB
clienteMongo = MongoClient("mongodb://localhost:27017/")  # Cambia el URI si es necesario
db = clienteMongo['Prueba_cargador']
collection = db['Mediciones']

# Crear una instancia del cliente MQTT
clienteMqtt = mqtt.Client()
clienteMqtt.on_message = on_message
clienteMqtt.on_disconnect = on_disconnect
clienteMqtt.connect("192.168.0.101", 1883, 60)
clienteMqtt.subscribe("estaciones/estacion_1/alertas")

try:
    # Crear una instancia de la clase Estacion con la mac
    mac_address = obtener_mac()
    estacion = Estacion(mac_address)
    
    # Crear el Change Stream para monitorear la colección
    with collection.watch() as stream:
        print("Monitoreando nuevos registros en la colección 'Mediciones'...")
        for change in stream:
            # Verificar si el cambio es de tipo 'insert'
            if change["operationType"] == "insert":
                
                # Obtener el documento insertado
                new_document = change["fullDocument"]
                print("Nuevo registro detectado:")
                print(new_document)
                
                mensaje = estacion.to_bytearray()
                enviar_mensaje(clienteMqtt, "estaciones/estacion_1", mensaje)

except PyMongoError as e:
    print(f"Ocurrió un error al monitorear la colección: {e}")
except KeyboardInterrupt:
    print("Monitoreo interrumpido por el usuario.")
finally:
    # Cerrar las conexiones
    clienteMongo.close()
    clienteMqtt.disconnect()
    clienteMqtt.loop_stop()  

