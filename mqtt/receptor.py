import mysql.connector
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

import paho.mqtt.client as mqtt
import time

from claseEstacion import Estacion


# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    global conexion
    variables = ['voltaje_1', 'voltaje_2', 'voltaje_3', 'voltaje_4', 'voltaje_5', 'intensidad_1', 'intensidad_2', 'temperatura']
    query = "SELECT nombre FROM estaciones WHERE dir_mac = %s"
    queryMediciones = """INSERT INTO mediciones (tipo, valor, tipo_medicion, estacion_id)
                            VALUES (%s, %s, %s, (SELECT id FROM estaciones WHERE dir_mac = %s))"""
    estacion = Estacion.from_bytearray(msg.payload)
    cursor.execute(query, [estacion.dir_mac])
    resultado = cursor.fetchone()[0]
    for variable in variables:
        cursor.execute(queryMediciones, estacion.obtener_medicion(variable))
    conexion.commit()
    print(resultado)


# Función para enviar un mensaje
def enviar_mensaje(client, topic, mensaje):
    client.publish(topic, mensaje)


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
client = mqtt.Client()
client.on_message = on_message
client.on_disconnect = on_disconnect
client.connect("localhost", 1883, 60)
client.subscribe("estaciones/+")

try:
    while True:
        client.loop_start()
        enviar_mensaje(client, "estaciones/estacion_1/alertas", "respuesta")
        time.sleep(2)
except KeyboardInterrupt:
    print("Interrupción del teclado recibida, cerrando el cliente MQTT.")
    client.disconnect()
    client.loop_stop()
