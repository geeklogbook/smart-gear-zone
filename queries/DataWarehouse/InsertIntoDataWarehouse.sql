
USE processed;
-- Poblar Dimensión Cliente
INSERT INTO processed.dim_cliente (IdCliente, Provincia, Nombre_y_Apellido, Edad, Localidad, Fecha_Alta, Usuario_Alta, Marca_Baja)
SELECT 
    IdCliente,
    Provincia,
    Nombre_y_Apellido,
    Edad,
    Localidad,
    Fecha_Alta,
    Usuario_Alta,
    Marca_Baja
FROM staging.cliente;

-- Poblar Dimensión Sucursal
INSERT INTO processed.dim_sucursal (IdSucursal, Sucursal, Localidad, Provincia, Latitud, Longitud)
SELECT 
    IdSucursal,
    Sucursal,
    Localidad,
    Provincia,
    Latitud,
    Longitud
FROM staging.sucursal;

-- Poblar Dimensión Producto
INSERT INTO processed.dim_producto (IdProducto, Producto, Categoria, Precio)
SELECT 
    IdProducto,
    Producto,
    Categoria,
    Precio
FROM staging.producto;

-- Poblar Dimensión Fecha
INSERT INTO processed.dim_fecha (FechaKey, Fecha, Anio, Mes, Día, Trimestre, Semana)
SELECT DISTINCT 
    DATE_FORMAT(Fecha, '%Y%m%d') AS FechaKey,
    Fecha,
    YEAR(Fecha) AS Anio,
    MONTH(Fecha) AS Mes,
    DAY(Fecha) AS Día,
    QUARTER(Fecha) AS Trimestre,
    WEEK(Fecha) AS Semana
FROM staging.venta
UNION
SELECT DISTINCT 
    DATE_FORMAT(Fecha_Entrega, '%Y%m%d') AS FechaKey,
    Fecha_Entrega,
    YEAR(Fecha_Entrega) AS Anio,
    MONTH(Fecha_Entrega) AS Mes,
    DAY(Fecha_Entrega) AS Día,
    QUARTER(Fecha_Entrega) AS Trimestre,
    WEEK(Fecha_Entrega) AS Semana
FROM staging.venta;

-- Poblar Dimensión Canal
INSERT INTO processed.dim_canal (IdCanal, Canal)
SELECT 
    IdCanal,
    Canal
FROM staging.canal_venta;

-- Poblar Dimensión Empleado
INSERT INTO processed.dim_empleado (IdEmpleado, Apellido, Nombre, IdSucursal, Salario)
SELECT IdEmpleado, 
       Apellido, 
       Nombre, 
       NULLIF(IdSucursal, 0),
       Salario
FROM staging.empleado;


INSERT INTO processed.hechos_venta (
    IdVenta, FechaKey, FechaEntregaKey, IdCanal, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad
)
SELECT 
    v.IdVenta,
    DATE_FORMAT(v.Fecha, '%Y%m%d') AS FechaKey,
    DATE_FORMAT(v.Fecha_Entrega, '%Y%m%d') AS FechaEntregaKey,
    v.IdCanal,
    v.IdCliente,
    v.IdSucursal,
    v.IdEmpleado,
    v.IdProducto,
    v.Precio,
    v.Cantidad
FROM staging.venta v
JOIN processed.dim_empleado e ON v.IdEmpleado = e.IdEmpleado;