INSERT INTO staging.sector (
    `IdSector`,
    `Sector`
)
SELECT 
`IdSector`,
`Sector`
 FROM raw.sector;

DROP TABLE raw.sector;