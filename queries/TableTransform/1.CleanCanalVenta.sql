INSERT INTO base_negocio_staging.canal_venta (
    `IdCanal`,
    `Canal`
)
SELECT
    `IdCanal`,
    `Canal`
FROM base_negocio_raw.canal_venta;

DROP TABLE base_negocio_raw.canal_venta;