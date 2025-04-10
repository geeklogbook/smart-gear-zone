INSERT INTO staging.tipo_gasto (
  `IdTipoGasto`,
  `Tipo_Gasto`
)
SELECT
  `IdTipoGasto`,
  `Descripcion`
FROM raw.tipo_gasto;

DROP TABLE raw.tipo_gasto;