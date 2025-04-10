INSERT INTO staging.venta
WITH clean_data AS (
    SELECT 
        IdVenta, 
        Fecha, 
        Fecha_Entrega,
        IdCanal,
        IdCliente, 
        IdSucursal, 
        IdEmpleado, 
        IdProducto, 
        CASE 
            WHEN Cantidad REGEXP '^[0-9]+$' THEN CAST(Cantidad AS SIGNED)
            ELSE NULL 
        END AS Cantidad_Clean,
        CASE 
            WHEN Precio REGEXP '^[0-9]+(\.[0-9]{1,3})?$' THEN Precio 
            ELSE NULL 
        END AS Precio_Clean
    FROM raw.venta
)
SELECT IdVenta, 
       Fecha, 
       Fecha_Entrega, 
       IdCanal, 
       IdCliente, 
       IdSucursal, 
       IdEmpleado, 
       IdProducto, 
       Precio_Clean, 
       Cantidad_Clean
FROM clean_data
WHERE Precio_Clean IS NOT NULL AND Cantidad_Clean IS NOT NULL;



INSERT INTO staging.venta_errores (
  IdVenta, 
  Fecha, 
  Fecha_Entrega, 
  IdCliente, 
  IdSucursal, 
  IdEmpleado, 
  IdProducto, 
  Precio, 
  Cantidad, 
  Motivo
)
WITH clean_data AS (
  SELECT 
    IdVenta, 
    Fecha, 
    Fecha_Entrega,
    IdCliente, 
    IdSucursal, 
    IdEmpleado, 
    IdProducto, 
    CASE WHEN Precio = '' THEN 'ERROR' ELSE Precio END AS Precio,
    CASE WHEN Cantidad = '' THEN 'ERROR' ELSE Cantidad END AS Cantidad,
    CASE 
      WHEN Precio = '' AND Cantidad = '' THEN 'No Price and No Quantity'
      WHEN Precio = '' THEN 'No Price'
      WHEN Cantidad = '' THEN 'No Quantity'
    END AS Motivo
  FROM raw.venta
)
SELECT 
  IdVenta, 
  Fecha, 
  Fecha_Entrega, 
  IdCliente, 
  IdSucursal, 
  IdEmpleado, 
  IdProducto, 
  Precio, 
  Cantidad, 
  Motivo
FROM clean_data
WHERE Precio = 'ERROR' OR Cantidad = 'ERROR';


DROP TABLE raw.venta;