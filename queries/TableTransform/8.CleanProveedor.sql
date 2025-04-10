-- Active: 1744155430133@@127.0.0.1@3306@raw
INSERT INTO staging.proveedor (
  `IdProveedor`,
  `Nombre`,
  `Domicilio`,
  `Ciudad`,
  `Provincia`,
  `Pais`,
  `Departamento`
)
SELECT
  IdProveedor,
  IFNULL(NULLIF(UC_Words(TRIM(Nombre)), ''), 'Sin Dato') AS Nombre,
  IFNULL(NULLIF(UC_Words(TRIM(Domicilio)), ''), 'Sin Dato') AS Domicilio,
  IFNULL(NULLIF(UC_Words(TRIM(Ciudad)), ''), 'Sin Dato') AS Ciudad,
  IFNULL(NULLIF(UC_Words(TRIM(Provincia)), ''), 'Sin Dato') AS Provincia,
  IFNULL(NULLIF(UC_Words(TRIM(Pais)), ''), 'Sin Dato') AS Pais,
  IFNULL(NULLIF(UC_Words(TRIM(Departamento)), ''), 'Sin Dato') AS Departamento
FROM raw.proveedor;

DROP TABLE raw.proveedor;
