# Steps in the ETL

## A - Preparation for the Ingestion (Extraction) - In Raw Layer

1. CreateRawTables.sql
    1. canal_venta **<- canalDeVenta.csv**
    1. cargo       **<- cargo.csv**
    1. cliente     **<- clientes.csv**
    1. compra      **<- compra.csv**
    1. empleado    **<- empleados.csv**
    1. gasto       **<- gasto.csv**
    1. producto    **<- productos.csv**
    1. proveedor   **<- proveedores.csv**
    1. sector      **<- sector.csv**
    1. sucursal    **<- sucursal.csv**
    1. tipo_gasto  **<- tipoDeGasto.csv**
    1. venta       **<- venta.csv**
1. LoadRawData.sql - Ingest Raw Data
1. CreateStagingTables.sql
    1. canal_venta
    1. cargo
    1. cliente
    1. compra
    1. empleado
    1. gasto
    1. producto
    1. proveedor
    1. sector
    1. sucursal
    1. tipo_gasto
    1. venta
    1. errores_venta - New Audit Table
1. CreateCalendarTable.sql - Auxiliary Table - (In Staging)
1. FunctionSanitizeTitleCase.sql Auxiliary Funtion - (In Staging)
## B - Transform the Data - In Staging Layer
1. CleanCanalVenta.sql
1. CleanCargo.sql
1. CleanClientes.sql
1. CleanCompra.sql
1. CleanEmpleado.sql
1. CleanGasto.sql
1. CleanProducto.sql
1. CleanProveedor.sql
1. CleanTipoGasto.sql
1. CleanSector.sql
1. CleanSucursal.sql
1. CleanVenta.sql

## C - Load Into the Data Warehouse
1. CreateDataWarehouse.sql
1. InsertIntoDataWarehouse.sql