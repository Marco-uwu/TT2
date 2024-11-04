-- Crear la base de datos
CREATE DATABASE estaciones_carga;
USE estaciones_carga;

-- Crear la tabla 'estaciones'
CREATE TABLE estaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(255),
    estado ENUM('Disponible', 'No disponible', 'Fuera de servicio') NOT NULL
);

-- Crear la tabla 'mediciones' con el tipo de medición modificado
CREATE TABLE mediciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    valor DECIMAL(5, 2),
    tipo_medicion ENUM('V', 'I', 'T', 'N/A') NOT NULL,
    hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estacion_id INT,
    FOREIGN KEY (estacion_id) REFERENCES estaciones(id)
);

-- Consultas de ejemplo

-- Insertar una estación
INSERT INTO estaciones (nombre, ubicacion, estado) 
VALUES ('Estacion ESCOM', 'GV33+VF Ciudad de México, Cd. de México', 'Disponible');

-- Insertar mediciones de voltaje para una estación
INSERT INTO mediciones (tipo, valor, tipo_medicion, estacion_id) 
VALUES 
('voltaje_1', 220.5, 'V', 1),
('voltaje_2', 221.0, 'V', 1),
('voltaje_3', 219.8, 'V', 1),
('voltaje_4', 220.2, 'V', 1),
('voltaje_5', 220.7, 'V', 1);

-- Insertar mediciones de intensidad para una estación
INSERT INTO mediciones (tipo, valor, tipo_medicion, estacion_id) 
VALUES 
('intensidad_1', 10.5, 'I', 1),
('intensidad_2', 10.7, 'I', 1);

-- Insertar medición de temperatura para una estación
INSERT INTO mediciones (tipo, valor, tipo_medicion, estacion_id) 
VALUES 
('temperatura', 25.3, 'T', 1);


/*
+-----------+--------------------------------------------------------+------+-----+---------+----------------+
| Field     | Type                                                   | Null | Key | Default | Extra          |
+-----------+--------------------------------------------------------+------+-----+---------+----------------+
| id        | int                                                    | NO   | PRI | NULL    | auto_increment |
| nombre    | varchar(100)                                           | YES  |     | NULL    |                |
| ubicacion | varchar(255)                                           | YES  |     | NULL    |                |
| estado    | enum('Disponible','No disponible','Fuera de servicio') | NO   |     | NULL    |                |
+-----------+--------------------------------------------------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> describe mediciones;
+---------------+-------------------------+------+-----+-------------------+-------------------+
| Field         | Type                    | Null | Key | Default           | Extra             |
+---------------+-------------------------+------+-----+-------------------+-------------------+
| id            | int                     | NO   | PRI | NULL              | auto_increment    |
| tipo          | varchar(50)             | YES  |     | NULL              |                   |
| valor         | decimal(5,2)            | YES  |     | NULL              |                   |
| tipo_medicion | enum('V','I','T','N/A') | NO   |     | NULL              |                   |
| hora          | timestamp               | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| estacion_id   | int                     | YES  | MUL | NULL              |                   |
+---------------+-------------------------+------+-----+-------------------+-------------------+*/
