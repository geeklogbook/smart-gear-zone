INSERT INTO staging.canal_venta (
    `IdCanal`,
    `Canal`
)
SELECT
    `IdCanal`,
    `Canal`
FROM raw.canal_venta;

DROP TABLE raw.canal_venta;