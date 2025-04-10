INSERT INTO staging.producto (
    `IdProducto`,
    `Producto`,
    `Categoria`,
    `Precio`
)
SELECT
    IdProducto,
    IFNULL(NULLIF(UC_Words(TRIM(Concepto)), ''), 'Sin Dato') AS Producto,
    IFNULL(NULLIF(UC_Words(TRIM(Tipo)), ''), 'Sin Dato') AS Categoria,
    Precio2 AS Precio
FROM raw.producto;

DROP TABLE raw.producto;