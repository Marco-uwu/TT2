import warnings
import paho.mqtt.client as mqtt

def enviar_apagado_manual(direccion):
    warnings.filterwarnings("ignore", category=DeprecationWarning)
    try:
        # Crear una instancia del cliente MQTT
        clienteMqtt = mqtt.Client()
        clienteMqtt.connect("localhost", 1883, 60)

        # Construir el tema y el mensaje
        tema = f"estaciones/alertas/{direccion}/shutdown"
        mensaje = ">> Apagado manual"
        
        # Publicar el mensaje
        clienteMqtt.publish(tema, mensaje)

        # Cerrar la conexión MQTT
        clienteMqtt.disconnect()
    except Exception as e:
        print(f"Error al intentar publicar el mensaje: {e}")

# Ejemplo de uso
direccion = "RTQ1RjAxN0Y5NjAz"
enviar_apagado_manual(direccion)
