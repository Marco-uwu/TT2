import time
import base64
import warnings
import mysql.connector
import paho.mqtt.client as mqtt
warnings.filterwarnings("ignore", category=DeprecationWarning)
from claseEstacion import Estacion

# Función de callback cuando un mensaje es recibido
def on_message(client, userdata, msg):
    global conexion
    tema = msg.topic
    estacion = Estacion.from_bytearray(msg.payload)
    direccion_estacion = estacion.dir_mac
    
    query = "SELECT EXISTS (SELECT 1 FROM estaciones WHERE dir_mac = %s) AS existe"
    cursor.execute(query, [direccion_estacion])
    resultado = cursor.fetchone()[0]
    existe = bool(resultado)
    
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
client.subscribe("estaciones/mediciones/+")

try:
    while True:
        client.loop_start()
        enviar_mensaje(client, "estaciones/estacion_1/alertas", "respuesta")
        time.sleep(2)
except KeyboardInterrupt:
    print("Interrupción del teclado recibida, cerrando el cliente MQTT.")
    client.disconnect()
    client.loop_stop()