CREATE DATABASE FemaleStore;
USE FemaleStore;
CREATE TABLE Cliente(
idCliente INT auto_increment PRIMARY KEY,
nombre VARCHAR (25) NOT NULL,
apellido VARCHAR (25) NOT NULL,
direccion VARCHAR (30) NOT NULL,
telefono INT NOT NULL,
saldo FLOAT NOT NULL
);

CREATE TABLE compras(
codigoCompra INT auto_increment PRIMARY KEY,
nombreProducto VARCHAR (25) NOT NULL,
color VARCHAR (20) NOT NULL,
marca VARCHAR (20) NOT NULL,
modelo VARCHAR (20) NOT NULL,
cantidad INT NOT NULL,
precio FLOAT NOT NULL
);
ALTER TABLE compras ADD cod_Producto INT NOT NULL;

CREATE TABLE pqrs(
documentoCliente INT auto_increment PRIMARY KEY,
nombreCliente VARCHAR (25) NOT NULL,
apellido VARCHAR (20) NOT NULL,
direccion VARCHAR (30) NOT NULL,
telefono DOUBLE NOT NULL,
mensaje VARCHAR (1000) NOT NULL,
foreign key (documentoCliente) REFERENCES Cliente (idCliente)
);

CREATE TABLE producto(
idProducto INT auto_increment PRIMARY KEY,
nombreProducto VARCHAR (25) NOT NULL,
color VARCHAR (20) NOT NULL,
marca VARCHAR (25) NOT NULL,
modelo VARCHAR (20) NOT NULL,
cantidad INT NOT NULL,
foreign key (idProducto) REFERENCES compras (codigoCompra)
);

CREATE TABLE credito (
codigoCredito INT auto_increment PRIMARY KEY,
doc_Cliente INT NOT NULL,
nombreCliente VARCHAR (25) NOT NULL,
direccion VARCHAR (30) NOT NULL,
telefono INT NOT NULL,
monto FLOAT NOT NULL,
foreign key (codigoCredito) REFERENCES Cliente (idCliente)
);

CREATE TABLE facturas (
idFactura INT auto_increment PRIMARY KEY,
cliente VARCHAR (25) NOT NULL,
direccion VARCHAR (30) NOT NULL,
telefono INT NOT NULL,
descuento FLOAT NOT NULL,
foreign key (idFactura) REFERENCES compras (codigoCompra),
foreign key (idFactura) REFERENCES producto (idProducto)
);

CREATE TABLE administrador(
documentoAdmin INT  PRIMARY KEY,
nombreAdmin VARCHAR (25) NOT NULL,
direccion VARCHAR (30) NOT NULL,
telefono INT NOT NULL
);

CREATE TABLE empleado (
documentoEmpleado INT PRIMARY KEY,
nombre VARCHAR (25) NOT NULL,
direccion VARCHAR (30) NOT NULL,
telefono INT NOT NULL
);

CREATE TABLE login (
id_Rol INT auto_increment PRIMARY KEY,
nombreUsuario VARCHAR (25) NOT NULL,
contraseña VARCHAR (25) NOT NULL,
foreign key (id_Rol) REFERENCES administrador (documentoAdmin),
foreign key (id_Rol) REFERENCES empleado (documentoEmpleado)
);
