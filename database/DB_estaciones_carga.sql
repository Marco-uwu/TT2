-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS estaciones_carga;
USE estaciones_carga;

-- Crear la tabla 'reglas_medicion'
CREATE TABLE reglas_medicion (
    id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(255),
    PRIMARY KEY (id)
);

-- Crear la tabla 'estaciones'
CREATE TABLE estaciones (
    id INT NOT NULL AUTO_INCREMENT,
	id_regla INT NOT NULL DEFAULT 1,
    nombre VARCHAR(100),
    ubicacion VARCHAR(255),
    estado ENUM('Disponible', 'No disponible', 'Fuera de servicio') NOT NULL DEFAULT 'Fuera de servicio',
    dir_mac VARCHAR(16) NOT NULL UNIQUE,
    PRIMARY KEY (id),
	FOREIGN KEY (id_regla) REFERENCES reglas_medicion(id)
);

-- Crear la tabla 'tipos_medicion' con tipo_medicion incluido
CREATE TABLE tipos_medicion (
    id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    tipo_medicion ENUM('V', 'I', 'T', 'N/A') NOT NULL DEFAULT 'N/A',
    PRIMARY KEY (id),
    UNIQUE (descripcion)
);

-- Crear la tabla 'mediciones'
CREATE TABLE mediciones (
    id INT NOT NULL AUTO_INCREMENT,
    valor DECIMAL(5,2),
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_estacion INT,
    id_tipo_medicion INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_estacion) REFERENCES estaciones(id),
    FOREIGN KEY (id_tipo_medicion) REFERENCES tipos_medicion(id)
);

-- Crear la tabla 'parametros_medicion'
CREATE TABLE parametros_medicion (
    id INT NOT NULL AUTO_INCREMENT,
	id_regla INT NOT NULL,
    id_tipo_medicion INT NOT NULL,
    valor_min DECIMAL(5,2) NOT NULL,
    valor_ide DECIMAL(5,2) NOT NULL,
    valor_max DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipo_medicion) REFERENCES tipos_medicion(id),
    FOREIGN KEY (id_regla) REFERENCES reglas_medicion(id),
	UNIQUE (id_regla, id_tipo_medicion)
);

-- Crear la tabla 'reportes'
CREATE TABLE reportes (
    id INT NOT NULL AUTO_INCREMENT,
    id_medicion INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_medicion) REFERENCES mediciones(id)
);


INSERT INTO tipos_medicion (descripcion, tipo_medicion) VALUES 
('voltaje_1', 'V'),
('voltaje_2', 'V'),
('voltaje_3', 'V'),
('voltaje_4', 'V'),
('voltaje_5', 'V'),
('intensidad_1', 'I'),
('intensidad_2', 'I'),
('temperatura', 'T');

INSERT INTO reglas_medicion (id, nombre) VALUES (1, 'GENERAL');
INSERT INTO parametros_medicion (id_regla, id_tipo_medicion, valor_min, valor_ide, valor_max) VALUES 
(1, 1, 10, 11, 12),
(1, 2, 10, 11, 12),
(1, 3, 100, 120, 140),
(1, 4, 10, 11, 12),
(1, 5, 10, 11, 12),
(1, 6, 16, 20, 30),
(1, 7, 16, 20, 30),
(1, 8, 0, 25, 45);

-- Consultas de inicio
INSERT INTO estaciones (nombre, ubicacion, estado, dir_mac) VALUES 
('Estacion ESCOM', 'GV33+VF Ciudad de México, Cd. de México', 'Disponible', 'RTQ1RjAxN0Y5NjAz'),
('Estacion ESIME', 'FVX8+6J Ciudad de México, Cd. de México', 'Fuera de servicio', 'NjQ1RDg2MUREMTdC'),
('Estación ESIA', 'GV37+J4 Ciudad de México, Cd. de México', 'No disponible', 'NjQ1RDg2MUREMTdX');

INSERT INTO mediciones (valor, id_estacion, id_tipo_medicion) VALUES 
(220.50, 1, 1),
(221.00, 1, 2),
(219.80, 1, 3),
(220.20, 1, 4),
(220.70, 1, 5),
(10.50, 1, 6),
(10.70, 1, 7),
(25.30, 1, 8);