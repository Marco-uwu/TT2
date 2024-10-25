CREATE DATABASE estaciones_carga;
USE estaciones_carga;

CREATE TABLE estaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(255)
);

CREATE TABLE mediciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    voltaje_1 FLOAT,
    voltaje_2 FLOAT,
    voltaje_3 FLOAT,
    voltaje_4 FLOAT,
    voltaje_5 FLOAT,
    intensidad_1 FLOAT,
    intensidad_2 FLOAT,
    temperatura FLOAT,
    hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estacion_id INT,
    FOREIGN KEY (estacion_id) REFERENCES estaciones(id)
);


------------------------------------------------------------------

-- Querys 

-- Insertar una estación
INSERT INTO estaciones (nombre, ubicacion) VALUES ('Estacion ESCOM', 'GV33+VF Ciudad de México, Cd. de México');

-- Insertar mediciones para una estación
INSERT INTO mediciones (voltaje_1, voltaje_2, voltaje_3, voltaje_4, voltaje_5, intensidad_1, intensidad_2, temperatura, estacion_id) 
VALUES (220.5, 221.0, 219.8, 220.2, 220.7, 10.5, 10.7, 25.3, 1);
