import RPi.GPIO as GPIO
import time
import uuid
import base64
import warnings
import paho.mqtt.client as mqtt
from pymongo import MongoClient
from claseEstacion import Estacion
from pymongo.errors import PyMongoError
warnings.filterwarnings("ignore", category=DeprecationWarning)
def configurar_gpio(pin: int):
    """
    Configura el GPIO para el uso de un LED.
    """
    GPIO.setmode(GPIO.BCM)  # Usar la numeración BCM
    GPIO.setup(pin, GPIO.OUT)  # Configurar el pin como salida

def encender_led(pin: int):
    """
    Enciende un LED conectado a un pin GPIO de la Raspberry Pi.

    Args:
        pin (int): Número del pin GPIO donde está conectado el LED (en el esquema BCM).
    """
    GPIO.output(pin, GPIO.HIGH)  # Activar el pin

def apagar_led(pin: int):
    """
    Apaga un LED conectado a un pin GPIO de la Raspberry Pi.

    Args:
        pin (int): Número del pin GPIO donde está conectado el LED (en el esquema BCM).
    """
    GPIO.output(pin, GPIO.LOW)  # Desactivar el pin

# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    topic = msg.topic
    print(f"Mensaje: {topic}")
    if topic.endswith("/shutdown"):
        print("\n - - - APAGAR ESTACIÓN - - -")
        PIN_LED = 17
        apagar_led(17)
        print(f"PAYLOAD :{estacion}")
        clienteMqtt.publish("estaciones/estado/f_servicio", estacion.to_bytearray())
    else:
        print("\nALERTA!!: " + msg.payload.decode() + "\n")


# Función de callback cuando el cliente se desconecta
def on_disconnect(client, userdata, rc):
    if rc == 0:
        print("Desconexión del cliente MQTT")
    else:
        print("Desconexión inesperada del cliente MQTT")


# Obtener la dirección MAC
def obtener_dir():
    dir_mac = ''.join(['{:02x}'.format((uuid.getnode() >> elements) & 0xff) for elements in range(0, 8 * 6, 8)][::-1])
    dir_mac = dir_mac.upper()
    mac_bytes = dir_mac.encode('utf-8')
    mac_base64 = base64.urlsafe_b64encode(mac_bytes).decode('utf-8')
    return mac_base64


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

dir_mac = obtener_dir()
direccionMqtt = "estaciones/mediciones/" + dir_mac
direccionAlertas = "estaciones/alertas/" + dir_mac + "/+"
clienteMqtt.subscribe(direccionAlertas)

clienteMqtt.loop_start()

try:
    # Crear una instancia de la clase Estacion con la mac
    estacion = Estacion(dir_mac)
    clienteMqtt.publish("estaciones/estado/disponible", estacion.to_bytearray())
    
    # Crear el Change Stream para monitorear la colección
    with collection.watch() as stream:
        print("Monitoreando nuevos registros en la colección 'Mediciones'...")
        PIN_LED = 17
        configurar_gpio(PIN_LED)
        encender_led(PIN_LED) 
        for change in stream:
            # Verificar si el cambio es de tipo 'insert'
            if change["operationType"] == "insert":
                
                # Obtener el documento insertado
                new_document = change["fullDocument"]
                
                v1 = float(new_document.get("V_Panel"))
                v2 = float(new_document.get("V_Aerogenerador"))
                v3 = float(new_document.get("V_Bateria"))
                v4 = float(new_document.get("V_CFE"))
                v5 = float(new_document.get("V_Inversor"))
                i1 = float(new_document.get("I_Entrada"))
                i2 = float(new_document.get("I_Inversor"))
                t =  float(new_document.get("T_Bateria"))
                
                estacion.asignar_valores(v1, v2, v3, v4, v5, i1, i2, t)
                print("\nNuevo registro detectado! Enviando...\n")
                
                mensaje = estacion.to_bytearray()
                clienteMqtt.publish(direccionMqtt, mensaje)

except PyMongoError as e:
    print(f"Ocurrió un error al monitorear la colección: {e}")
except KeyboardInterrupt:
    print("Monitoreo interrumpido por el usuario.")
finally:
    # Cerrar las conexiones
    clienteMqtt.publish("estaciones/estado/f_servicio", estacion.to_bytearray())
    GPIO.cleanup()
    clienteMongo.close()
    clienteMqtt.disconnect()
    clienteMqtt.loop_stop()  

