-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS estaciones_carga;
USE estaciones_carga;

-- Crear la tabla 'estaciones'
CREATE TABLE estaciones (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    ubicacion VARCHAR(255),
    estado ENUM('Disponible', 'No disponible', 'Fuera de servicio') NOT NULL DEFAULT 'Fuera de servicio',
    dir_mac VARCHAR(16) NOT NULL UNIQUE,
    PRIMARY KEY (id)
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

-- Crear la tabla 'limites_medicion'
CREATE TABLE limites_medicion (
    id INT NOT NULL AUTO_INCREMENT,
    id_estacion INT NOT NULL,
    id_tipo_medicion INT NOT NULL,
    valor_min DECIMAL(5,2) NOT NULL,
    valor_max DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_estacion) REFERENCES estaciones(id),
    FOREIGN KEY (id_tipo_medicion) REFERENCES tipos_medicion(id),
    UNIQUE (id_estacion, id_tipo_medicion)
);

-- Consultas de ejemplo
INSERT INTO estaciones (nombre, ubicacion, estado, dir_mac) VALUES 
('Estacion ESCOM', 'GV33+VF Ciudad de México, Cd. de México', 'Disponible', 'RTQ1RjAxN0Y5NjAz'),
('Estacion ESIME', 'FVX8+6J Ciudad de México, Cd. de México', 'Fuera de servicio', 'NjQ1RDg2MUREMTdC'),
('Estación ESIA', 'GV37+J4 Ciudad de México, Cd. de México', 'No disponible', 'NjQ1RDg2MUREMTdX');

INSERT INTO tipos_medicion (descripcion, tipo_medicion) VALUES 
('voltaje_1', 'V'),
('voltaje_2', 'V'),
('voltaje_3', 'V'),
('voltaje_4', 'V'),
('voltaje_5', 'V'),
('intensidad_1', 'I'),
('intensidad_2', 'I'),
('temperatura', 'T');

INSERT INTO mediciones (valor, fecha, id_estacion, id_tipo_medicion) VALUES 
(12.35, '2024-11-10 10:15:00', 1, 1),  -- voltaje_1 para Estacion Central
(15.67, '2024-11-10 10:15:30', 1, 2),  -- voltaje_2 para Estacion Central
(7.89, '2024-11-10 10:16:00', 1, 6),   -- intensidad_1 para Estacion Central
(22.45, '2024-11-10 10:17:00', 2, 8),  -- temperatura para Estacion Norte
(14.32, '2024-11-10 10:18:00', 3, 4);  -- voltaje_4 para Estacion Sur

