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
    queryMediciones = """INSERT INTO mediciones (valor, id_estacion, id_tipo_medicion) VALUES 
                        (%s, (SELECT id FROM estaciones WHERE dir_mac = %s), %s);"""
    mediciones = estacion.obtener_mediciones()
    try:
        for tipo, medicion in enumerate(mediciones, start = 1):
            cursor.execute(queryMediciones, [medicion, estacion.dir_mac, tipo])
        conexion.commit()
        print(" > Nuevo registro almacenado!")
        return True
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


