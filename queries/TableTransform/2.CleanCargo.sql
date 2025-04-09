INSERT INTO base_negocio_staging.cargo (
    `IdCargo`,
    `Cargo`
)
SELECT 
    `IdCargo`,
    `Cargo`
 FROM base_negocio_raw.cargo;

DROP TABLE base_negocio_raw.cargo;
