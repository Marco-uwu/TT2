from decimal import Decimal

def convert_to_float(data):
    converted_data = []
    for item in data:
        values = tuple(float(val) if isinstance(val, Decimal) else val for val in item)
        converted_data.append(values)
    return converted_data


def existe_cliente(cursor, direccion_estacion):
    query = "SELECT EXISTS (SELECT 1 FROM estaciones WHERE dir_mac = %s) AS existe"
    cursor.execute(query, [direccion_estacion])
    return bool(cursor.fetchone()[0])


def inserta_mediciones(estacion, conexion, cursor):
    # Consulta para insertar medición y devolver el ID
    queryMediciones = """INSERT INTO mediciones (valor, id_estacion, id_tipo_medicion) VALUES 
                         (%s, (SELECT id FROM estaciones WHERE dir_mac = %s), %s);"""

    # Consulta para verificar si la medición supera límites
    queryVerificaLimites = """
        SELECT 
            p.id AS id_parametro, e.id_regla AS id_regla
        FROM 
            mediciones m
        JOIN 
            estaciones e ON m.id_estacion = e.id
        JOIN 
            parametros_medicion p ON e.id_regla = p.id_regla AND m.id_tipo_medicion = p.id_tipo_medicion
        WHERE 
            m.id = %s AND (m.valor < p.valor_min OR m.valor > p.valor_max);
    """
    
    # Consulta para insertar en la tabla reportes
    queryInsertaReporte = """INSERT INTO reportes (id_medicion) VALUES (%s);"""

    mediciones = estacion.obtener_mediciones()
    
    reportes = []

    try:
        for tipo, medicion in enumerate(mediciones, start=1):
            # Insertar medición y recuperar su ID
            cursor.execute(queryMediciones, [medicion, estacion.dir_mac, tipo])
            id_medicion = cursor.lastrowid  # Obtener el ID recién insertado

            # Verificar si la medición excedió los límites
            cursor.execute(queryVerificaLimites, [id_medicion])
            resultado = cursor.fetchone()

            if resultado:
                # Insertar el reporte si hay un valor fuera de rango
                cursor.execute(queryInsertaReporte, [id_medicion])
                reportes.append(resultado)

        conexion.commit()
        print(" > Nuevos registros almacenados")

        return reportes if reportes else True
    except mysql.connector.Error as err:
        print(f"Error al insertar datos: {err}")
        conexion.rollback()
        return False

def actualiza_parametros(cursor):
    queryMaximos =   """SELECT 
                            p.valor_min,  
                            p.valor_max
                        FROM 
                            parametros_medicion p
                        JOIN 
                            tipos_medicion t ON p.id_tipo_medicion = t.id
                        ORDER BY p.id_regla, t.id;"""
    try:
        cursor.execute(queryMaximos, [])
        resultados = convert_to_float(cursor.fetchall())
        return resultados
    except mysql.connector.Error as err:
        print(f"Error al actualizar parámetros: {err}")
        return None


def verifica_mediciones(estacion, arregloParametros):
    arregloMediciones = estacion.obtener_mediciones()
    mediciones_fuera_de_limites = []
    
    for id_medicion, medicion in enumerate(arregloMediciones):
        if medicion > arregloParametros[id_medicion][1] or medicion < arregloParametros[id_medicion][0]:
            mediciones_fuera_de_limites.append((id_medicion, medicion))
    
    return mediciones_fuera_de_limites



