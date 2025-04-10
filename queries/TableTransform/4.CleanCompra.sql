INSERT INTO staging.compra (
    `IdCompra`,
    `Fecha`,
    `IdProducto`,
    `Cantidad`,
    `Precio`,
    `IdProveedor`
)
SELECT
    `IdCompra`,
    `Fecha`,
    `IdProducto`,
    `Cantidad`,
    `Precio`,
    `IdProveedor`
FROM raw.compra;

DROP TABLE raw.compra;