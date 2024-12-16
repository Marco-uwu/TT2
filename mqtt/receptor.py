import time
import base64
import warnings
import mysql.connector
import paho.mqtt.client as mqtt
warnings.filterwarnings("ignore", category=DeprecationWarning)
from claseEstacion import Estacion
from funcionesServidor import *

# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    
    topic = msg.topic
    #print(topic)
    if topic.startswith("estaciones/mediciones/"):
        estacion = Estacion.from_bytearray(msg.payload)
        direccion_estacion = estacion.dir_mac
        tema_mqtt = "estaciones/alertas/" + direccion_estacion
        
        existe = existe_cliente(cursor, direccion_estacion)
        
        if (existe):
            errores = inserta_mediciones(estacion, conexion, cursor)
            if isinstance(errores, list):
                clienteMqtt.publish(tema_mqtt + "/shutdown", f">> Mediciones fuera de límites! {errores}")
            else:
                clienteMqtt.publish(tema_mqtt+ "/ok", ">> OK!")
        else:
            print(f"Estación no registrada, solicite ayuda con el administrador.")
    elif topic.startswith("estaciones/estado/"):
        estacion = Estacion.from_bytearray(msg.payload)
        direccion_estacion = estacion.dir_mac
        existe = existe_cliente(cursor, direccion_estacion)
        if (existe):
            if topic.startswith("estaciones/estado/disponible"):
                actualizar_estado_por_mac(conexion, cursor, direccion_estacion, "Disponible")
            elif topic.startswith("estaciones/estado/f_servicio"):
                actualizar_estado_por_mac(conexion, cursor, direccion_estacion, "Fuera de servicio")
            elif topic.startswith("estaciones/estado/no_disponible"):
                actualizar_estado_por_mac(conexion, cursor, direccion_estacion, "No disponible")

# Función de callback cuando el cliente se desconecta
def on_disconnect(client, userdata, rc):
    if rc == 0:
        print("Desconexión del cliente MQTT")
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
clienteMqtt = mqtt.Client()
clienteMqtt.on_message = on_message
clienteMqtt.on_disconnect = on_disconnect
clienteMqtt.connect("localhost", 1883, 60)
clienteMqtt.subscribe("estaciones/#")

parametros = actualiza_parametros(cursor)

try:
    clienteMqtt.loop_forever()
except KeyboardInterrupt:
    print("Interrupción del teclado recibida, cerrando el cliente MQTT.")
    clienteMqtt.disconnect()
    clienteMqtt.loop_stop()
