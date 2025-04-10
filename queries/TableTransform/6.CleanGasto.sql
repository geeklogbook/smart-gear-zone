INSERT INTO staging.gasto (
    `IdGasto`,
    `IdSucursal`,
    `IdTipoGasto`,
    `Fecha`,
    `Monto`
)
SELECT
    `IdGasto`,
    `IdSucursal`,
    `IdTipoGasto`,
    `Fecha`,
    `Monto`
FROM raw.gasto;

DROP TABLE raw.gasto;