-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS proyecto_jsp_jdbc;

-- Crear la base de datos
CREATE DATABASE proyecto_jsp_jdbc;

-- Seleccionar la base de datos
USE proyecto_jsp_jdbc;

-- Crear la tabla usuario
CREATE TABLE usuario (
    usuario VARCHAR(20) PRIMARY KEY,
    contrasena VARCHAR(64) NOT NULL
    );
-- Crear la tabla cliente
CREATE TABLE cliente (
     cliente_id INT PRIMARY KEY NOT NULL,
     nombre_completo VARCHAR(100) NOT NULL,
     direccion VARCHAR(255) NOT NULL,
     telefono VARCHAR(15) NOT NULL,
     fecha_nacimiento DATE NOT NULL
);
INSERT INTO usuario (usuario, contrasena) VALUES ('user', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb');
INSERT INTO usuario (usuario, contrasena) VALUES ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');