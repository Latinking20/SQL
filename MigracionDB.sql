USE MigracionDB;
CREATE TABLE Cliente(
idCliente INT PRIMARY KEY,
nombre VARCHAR (25) NOT NULL,
apellido VARCHAR (30) NOT NULL,
direccion VARCHAR (35) NOT NULL,
telefono INT NOT NULL,
saldo FLOAT NOT NULL
);
INSERT INTO Cliente (idCliente, nombre, apellido, direccion, telefono, saldo) VALUES ('1005', ' Maria Alejandra', ' Lopez Valbuena', ' Calle 57 # 14A -98', '2356871', '2000000');
INSERT INTO Cliente (idCliente, nombre, apellido, direccion, telefono, saldo) VALUES ('1122', ' Jessika Marcela', ' Rojas Buitrago', ' Calle 87 # 19A -90', '5874103', '4500000');
INSERT INTO Cliente (idCliente, nombre, apellido, direccion, telefono, saldo) VALUES ('1028', ' Laura Patricia', ' Ballesteros Botero', ' Calle 77 # 15A -70', '3210789', '3800000');
INSERT INTO Cliente (idCliente, nombre, apellido, direccion, telefono, saldo) VALUES ('2347', ' Diana Paola', ' Nuñez Rodriguez', ' Calle 117 # 45Bis -50', '2771459', '3000000');
INSERT INTO Cliente (idCliente, nombre, apellido, direccion, telefono, saldo) VALUES ('4587', ' Luciana Maria', ' Fuster Callao', ' Calle 67 # 11A -72', '4912783', '2500000');

SELECT * FROM Cliente;

CREATE TABLE Compras (
codigoCompra INT PRIMARY KEY,
nombreProducto VARCHAR (25) NOT NULL,
color VARCHAR (25) NOT NULL,
marca VARCHAR (25) NOT NULL,
modelo VARCHAR (30) NOT NULL,
cantidad INT NOT NULL,
precio FLOAT NOT NULL,
idCliente INT CONSTRAINT FK_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
);
INSERT INTO Compras (codigoCompra, nombreProducto, color, marca, modelo, cantidad, precio) VALUES ('00154', ' Bolso', 'Negro', 'TOUS', ' De mano', '2', '180000');
INSERT INTO Compras (codigoCompra, nombreProducto, color, marca, modelo, cantidad, precio) VALUES ('14587', ' Blusa', 'Amarillo y Rosado', 'Fashion lover', ' Tipo Escote', '2', '90000');



SELECT * FROM Compras;

CREATE TABLE Producto (
idProducto INT PRIMARY KEY,
nombreProducto VARCHAR (30) NOT NULL,
color VARCHAR (25) NOT NULL,
marca VARCHAR (25) NOT NULL,
modelo VARCHAR (30) NOT NULL,
cantidad FLOAT NOT NULL,
codigoCompra INT CONSTRAINT FK_Compras FOREIGN KEY (codigoCompra) REFERENCES Compras (codigoCompra)
);

CREATE TABLE Credito (
codigoCredito INT PRIMARY KEY,
docu_Cliente INT NOT NULL,
nombreCliente VARCHAR (25) NOT NULL,
direccion VARCHAR (35) NOT NULL,
telefono INT NOT NULL,
monto FLOAT NOT NULL
);

CREATE TABLE Facturas (
idFactura INT PRIMARY KEY,
cliente VARCHAR (30) NOT NULL,
direccion VARCHAR (35) NOT NULL,
telefono INT NOT NULL,
codigoCredito INT CONSTRAINT FK_Credito FOREIGN KEY (codigoCredito) REFERENCES Credito (codigoCredito)
);

CREATE TABLE IniciarSesion (
idRol INT PRIMARY KEY,
Usuario VARCHAR (40) NOT NULL,
clave VARCHAR (35) NOT NULL
);
INSERT INTO IniciarSesion (idRol, Usuario, clave) VALUES ('01', 'adminStore', 'FemmStore')
INSERT INTO IniciarSesion (idRol, Usuario, clave) VALUES ('02', 'salesStore', 'Fashionlover')
INSERT INTO IniciarSesion (idRol, Usuario, clave) VALUES ('03', 'generalStore', 'Love2024')

SELECT * FROM IniciarSesion;