INSERT INTO base_negocio_today.sector (
    `IdSector`,
    `Sector`
)
SELECT 
`IdSector`,
`Sector`
 FROM base_negocio_landing.sector;

DROP TABLE base_negocio_landing.sector;