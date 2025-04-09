-- Active: 1741138916750@@127.0.0.1@3306@base_negocio_landing
USE base_negocio_raw;

-- If you can't load the data using local data local infile
SET GLOBAL local_infile=1;

-- CSV File

--UBUNTU VM -> LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/Clientes.csv'
--WINDOWS LOCAL MACHINE -> LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\gadget-store\\data\\sources\\Clientes.csv'
--FTP CLIENT IN DOCKER -> '/ftp/csv/Clientes.csv'
LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\canalesDeVenta.csv'  
INTO TABLE canal_venta
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\cargos.csv' 
INTO TABLE cargo
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\clientes.csv'
INTO TABLE cliente
CHARACTER SET utf8
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE  'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\compras.csv' 
INTO TABLE compra 
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\Empleados.csv'
INTO TABLE empleado
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\gastos.csv'
INTO TABLE gasto 
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\Productos.csv' 
INTO TABLE producto 
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\Proveedores.csv' 
INTO TABLE proveedor
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\sectores.csv' 
INTO TABLE sector
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\Sucursales.csv' 
INTO TABLE sucursal
CHARACTER SET utf8
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\tiposDeGastos.csv' 
INTO TABLE tipo_gasto
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE  'C:\\Users\\h\\Documents\\geeklogbook\\202504\\smart-gear-zone\\data\\sources\\ventas.csv' 
INTO TABLE venta
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;