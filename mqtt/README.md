## Directorio `mqtt`

**Propósito:**

Este directorio contiene todos los scripts de Python necesarios para la comunicación entre múltiples clientes y un servidor utilizando el protocolo MQTT. Estos scripts se encargan de la lectura y escritura de datos en bases de datos MongoDB y MySQL, así como de la lógica de negocio para el procesamiento y envío de alertas.

**Estructura y contenido:**

* **`README.md`:** Este archivo proporciona una descripción detallada del directorio y de cada uno de los scripts que contiene.
* **`emisor.py`:** 
    * **Función:** Actúa como cliente MQTT.
    * **Tareas:**
        * Monitorea continuamente una base de datos MongoDB local.
        * Detecta nuevos registros en la base de datos.
        * Envía los nuevos registros al servidor MQTT, utilizando el protocolo MQTT para una comunicación eficiente y ligera.
        * Recibe alertas del servidor en caso de que se detecten valores fuera de los límites establecidos.
* **`receptor.py`:** 
    * **Función:** Actúa como servidor MQTT.
    * **Tareas:**
        * Recibe los mensajes enviados por los clientes.
        * Almacena los nuevos registros en una base de datos MySQL.
        * Realiza verificaciones sobre los datos recibidos para determinar si se exceden los límites establecidos.
        * Envía alertas a los clientes correspondientes en caso de que se detecten valores fuera de rango.
* **`claseEstacion.py`:** 
    * **Función:** Define la clase `Estacion`.
    * **Propósito:**
        * Representa un registro de una estación de medición en la base de datos MongoDB.
        * Proporciona métodos para acceder y manipular los datos de una estación.
        * Facilita el empaquetamiento de los datos en un formato adecuado para su envío a través de MQTT.
* **`funcionesServidor.py`:**
    * **Función:** Contiene las funciones relacionadas con la interacción con la base de datos MySQL.
    * **Tareas:**
        * Realiza consultas a la base de datos para obtener los límites permitidos para las mediciones.
        * Inserta nuevos registros en la base de datos.
        * Actualiza registros existentes en la base de datos.


