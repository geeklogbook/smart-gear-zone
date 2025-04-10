INSERT INTO staging.cargo (
    `IdCargo`,
    `Cargo`
)
SELECT 
    `IdCargo`,
    `Cargo`
 FROM raw.cargo;

DROP TABLE raw.cargo;
