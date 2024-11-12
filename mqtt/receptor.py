import time
import base64
import warnings
import mysql.connector
import paho.mqtt.client as mqtt
warnings.filterwarnings("ignore", category=DeprecationWarning)
from claseEstacion import Estacion

# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    
    estacion = Estacion.from_bytearray(msg.payload)
    direccion_estacion = estacion.dir_mac
    tema_mqtt = "estaciones/alertas/" + direccion_estacion
    
    query = "SELECT EXISTS (SELECT 1 FROM estaciones WHERE dir_mac = %s) AS existe"
    cursor.execute(query, [direccion_estacion])
    existe = bool(cursor.fetchone()[0])
    
    clienteMqtt.publish(tema_mqtt, ">> Mensaje desde el servidor!")
    
    if (existe):
        queryMediciones = """INSERT INTO mediciones (valor, id_estacion, id_tipo_medicion) VALUES 
                            (%s, (SELECT id FROM estaciones WHERE dir_mac = %s), %s);"""
        mediciones = estacion.obtener_mediciones()
        for tipo, medicion in enumerate(mediciones, start = 1):
            cursor.execute(queryMediciones, [medicion, direccion_estacion, tipo])
        conexion.commit()
        print("Registro guardado: ", estacion)
    else:
        print(f"La direccion {direccion_estacion} no corresponde a una estacion")

# Función para enviar un mensaje
def enviar_mensaje(client, topic, mensaje):
    client.publish(topic, mensaje)


# Función de callback cuando el cliente se desconecta
def on_disconnect(client, userdata, rc):
    if rc == 0:
        print("Desconexión del cliente MQTT")
    else:
        print("Desconexión inesperada del cliente MQTT")


def convert_to_float(data):
    converted_data = []
    for item in data:
        values = tuple(float(val) if isinstance(val, Decimal) else val for val in item)
        converted_data.append(values)
    return converted_data

def verifica_medicion(medicion, parametros):
    if(medicion > parametros[1] or medicion < parametros[0]):
        return False
    else:
        return True

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
clienteMqtt.subscribe("estaciones/mediciones/+")

try:
    clienteMqtt.loop_forever()
except KeyboardInterrupt:
    print("Interrupción del teclado recibida, cerrando el cliente MQTT.")
    clienteMqtt.disconnect()
    clienteMqtt.loop_stop()