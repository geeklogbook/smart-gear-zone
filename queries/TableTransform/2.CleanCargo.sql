INSERT INTO base_negocio_today.cargo (
    `IdCargo`,
    `Cargo`
)
SELECT 
    `IdCargo`,
    `Cargo`
 FROM base_negocio_landing.cargo;

DROP TABLE base_negocio_landing.cargo;
