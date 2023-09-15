CREATE DATABASE HDI;
USE HDI;

CREATE TABLE Clientes(
	IdCliente INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    CodigoPostal INT NOT NULL
);

CREATE TABLE Vendedores(
	IdVendedor INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    CodigoPostal INT NOT NULL
);

CREATE TABLE Articulos(
	IdArticulo INT NOT NULL PRIMARY KEY auto_increment,
    Descripcion VARCHAR(250) NOT NULL,
    Precio FLOAT NOT NULL,
    Stock INT NOT NULL,
    StockMinimo INT NOT NULL
);

CREATE TABLE Facturas(
	IdFactura INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    IdCliente INT NOT NULL,
    IdVendedor INT NOT NULL,
    FOREIGN KEY(IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY(IdVendedor) REFERENCES Vendedores(IdVendedor)
);

INSERT INTO Clientes (Nombre, Direccion, CodigoPostal) VALUES 
("Reynaldo", "Av. Marverde #209", 34500),
("Margarita", "Paseo de las Almas #234", 32675),
("Roger", "Presa del Sol #932", 37600);

INSERT INTO Vendedores (Nombre, Direccion, CodigoPostal) VALUES 
("Martin", "Lomas del Cumbres #123", 43900),
("Eugenio", "Av. Chapultepec #221", 34600),
("Jorge", "Paseo del Sol #230", 54300);

INSERT INTO Articulos (Descripcion, Precio, Stock, StockMinimo) VALUES 
("Sillon amplio para 2 personas", 799, 12, 899),
("Soporte para celular en coches, camionetas, etc.", 399, 50, 499),
("Mouse para computadores o laptops", 299, 30, 300);

INSERT INTO Facturas (Fecha, IdCliente, IdVendedor) VALUES 
("2023-09-02", 2, 1),
("2023-07-12", 1, 2),
("2023-09-10", 3, 1);

INSERT INTO Articulos (Descripcion, Precio, Stock, StockMinimo) VALUES 
("Gama de ventiladores portatiles para casa u oficina", 230, 60, 300);

SELECT Clientes.IdCliente, Clientes.Nombre, Vendedores.Nombre, Facturas.IdFactura, Facturas.Fecha 
FROM Facturas
LEFT JOIN Clientes
ON Clientes.IdCliente = Facturas.IdCliente
LEFT JOIN Vendedores
ON Vendedores.IdVendedor = Facturas.IdVendedor
WHERE Facturas.Fecha BETWEEN "2023-09-01" AND "2023-10-01";

SELECT Articulos.IdArticulo, Articulos.Descripcion
FROM Articulos
WHERE Articulos.Descripcion LIKE "_a%";