DROP DATABASE IF EXISTS processed;
CREATE DATABASE IF NOT EXISTS processed;
USE processed;

CREATE TABLE dim_cliente (
    IdCliente INT PRIMARY KEY,
    Provincia VARCHAR(50),
    Nombre_y_Apellido VARCHAR(80),
    Edad VARCHAR(5),
    Localidad VARCHAR(80),
    Fecha_Alta DATE,
    Usuario_Alta VARCHAR(20),
    Marca_Baja TINYINT
);

CREATE TABLE dim_sucursal (
    IdSucursal INT PRIMARY KEY,
    Sucursal VARCHAR(40),
    Localidad VARCHAR(80),
    Provincia VARCHAR(50),
    Latitud DECIMAL(13,10),
    Longitud DECIMAL(13,10)
);

CREATE TABLE dim_producto (
    IdProducto INT PRIMARY KEY,
    Producto VARCHAR(100),
    Categoria VARCHAR(50),
    Precio DECIMAL(15,3)
);

CREATE TABLE dim_fecha (
    FechaKey INT PRIMARY KEY,
    Fecha DATE,
    Anio INT,
    Mes INT,
    Día INT,
    Trimestre INT,
    Semana INT
);

CREATE TABLE dim_canal (
    IdCanal INT PRIMARY KEY,
    Canal VARCHAR(50)
);

CREATE TABLE dim_empleado (
    IdEmpleado INT PRIMARY KEY,
    Apellido VARCHAR(100) NOT NULL DEFAULT 'Desconocido',
    Nombre VARCHAR(100) NOT NULL DEFAULT 'Desconocido',
    IdSucursal INT NULL,
    Salario DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (IdSucursal) REFERENCES dim_sucursal(IdSucursal) ON DELETE SET NULL
);

CREATE TABLE hechos_venta (
    IdVenta INT,
    IdProducto INT,
    FechaKey INT,
    FechaEntregaKey INT,
    IdCanal INT,
    IdCliente INT,
    IdSucursal INT,
    IdEmpleado INT,
    Precio DECIMAL(15,3),
    Cantidad INT,
    PRIMARY KEY (IdVenta, IdProducto),
    FOREIGN KEY (FechaKey) REFERENCES dim_fecha(FechaKey),
    FOREIGN KEY (FechaEntregaKey) REFERENCES dim_fecha(FechaKey),
    FOREIGN KEY (IdCanal) REFERENCES dim_canal(IdCanal),
    FOREIGN KEY (IdCliente) REFERENCES dim_cliente(IdCliente),
    FOREIGN KEY (IdSucursal) REFERENCES dim_sucursal(IdSucursal),
    FOREIGN KEY (IdEmpleado) REFERENCES dim_empleado(IdEmpleado),
    FOREIGN KEY (IdProducto) REFERENCES dim_producto(IdProducto)
);