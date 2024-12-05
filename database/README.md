## Directorio `database`

**Propósito:**

Este directorio centraliza todos los archivos relacionados con la base de datos del proyecto. Aquí se almacenan los respaldos, scripts y configuraciones necesarias para su gestión y mantenimiento.

**Estructura y contenido:**

* **`README.md`:** Este archivo, el que estás leyendo ahora, proporciona una descripción general del directorio y de cada uno de los archivos que contiene.
* **`django_tablas_default.sql`:** Este script SQL define la estructura inicial de las tablas de la base de datos. Se utiliza como punto de partida para crear la base de datos y establecer las relaciones entre las entidades.
* **`respaldo-datos.sql`:** Contiene un respaldo exclusivo de los datos almacenados en las tablas de la base de datos. Este archivo es útil para restaurar solo la información sin afectar la estructura de las tablas.
* **`respaldo-tablas.sql`:** Este respaldo guarda únicamente la definición de las tablas (esquema) de la base de datos. Es útil para recrear la estructura de la base de datos sin incluir los datos.
* **`respaldo-total.sql`:** Este es un respaldo completo de la base de datos, incluyendo tanto la estructura de las tablas como los datos almacenados en ellas. Es el respaldo más completo y se recomienda para realizar restauraciones completas del sistema.

**Nomenclatura:**

Los archivos de respaldo siguen un patrón de nomenclatura sencillo:

* **`respaldo-`:** Indica que se trata de un archivo de respaldo.
* **`datos`:** Indica que el respaldo contiene únicamente los datos.
* **`tablas`:** Indica que el respaldo contiene únicamente la definición de las tablas.
* **`total`:** Indica que el respaldo es completo, incluyendo tanto la estructura como los datos.
