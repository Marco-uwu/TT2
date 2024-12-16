from decimal import Decimal
import mysql.connector

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
    
    queryVerificaSesion = """
                            SELECT 
                                IFNULL(
                                    (SELECT 
                                        CASE 
                                            WHEN fecha_fin IS NOT NULL THEN TRUE
                                            ELSE FALSE
                                        END AS is_fecha_fin_not_null
                                    FROM sesiones_carga
                                    WHERE id_estacion = (SELECT id FROM estaciones WHERE dir_mac = %s)
                                    ORDER BY fecha_inicio DESC
                                    LIMIT 1), 
                                    TRUE
                                ) AS resultado;
                          """
    queryCreaSesion = """ INSERT INTO sesiones_carga (id_estacion) VALUES ((SELECT id FROM estaciones WHERE dir_mac = %s)); """

    queryCierraSesion = """
                        UPDATE sesiones_carga
                        JOIN (
                            SELECT id
                            FROM sesiones_carga
                            WHERE id_estacion = (SELECT id FROM estaciones WHERE dir_mac = %s)
                            ORDER BY fecha_inicio DESC
                            LIMIT 1
                        ) AS subquery ON sesiones_carga.id = subquery.id
                        SET fecha_fin = NOW();
                        """

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

        intensidad_inversor = estacion.intensidad_2
        voltaje_inversor = estacion.voltaje_5

        cursor.execute(queryVerificaSesion, [estacion.dir_mac])
        nueva_sesion = bool(cursor.fetchone()[0])
        
        if intensidad_inversor > 1:
            potencia = intensidad_inversor * voltaje_inversor
            cursor.execute(queryMediciones, [potencia, estacion.dir_mac, 9])
            if nueva_sesion:
                print(f"Crear nueva sesión en estacion: {estacion.dir_mac}")
                cursor.execute(queryCreaSesion, [estacion.dir_mac])
                actualizar_estado_por_mac(conexion, cursor, estacion.dir_mac, 'No disponible')
            else:
                print("Guardar en sesión activa")
        elif not nueva_sesion:
            print("Cerrar sesión activa")
            actualizar_estado_por_mac(conexion, cursor, estacion.dir_mac, 'Disponible')
            cursor.execute(queryCierraSesion, [estacion.dir_mac])
        else:
            print("Sin sesión activa, inserción de datos...")

        conexion.commit()
        #print(" > Nuevos registros almacenados")

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


def actualizar_estado_por_mac(conexion, cursor, dir_mac, nuevo_estado):
    # Consulta SQL para actualizar el estado
    query = """
    UPDATE estaciones
    SET estado = %s
    WHERE dir_mac = %s;
    """
    
    try:
        # Ejecutar la consulta con los parámetros proporcionados
        cursor.execute(query, (nuevo_estado, dir_mac))
        
        # Confirmar los cambios
        conexion.commit()
        
        #print(f"Estado de la estación con dir_mac {dir_mac} actualizado a '{nuevo_estado}'.")
        return True
    except mysql.connector.Error as err:
        print(f"Error al actualizar el estado: {err}")
        conexion.rollback()
        return False
