INSERT INTO staging.empleado_duplicados (
    IdEmpleado,
    Apellido,
    Nombre,
    IdSucursal,
    IdSector,
    IdCargo,
    Salario
)
SELECT e.*
FROM raw.empleado e
JOIN (
    SELECT IdEmpleado
    FROM raw.empleado
    GROUP BY IdEmpleado
    HAVING COUNT(*) > 1
) dup ON e.IdEmpleado = dup.IdEmpleado;

INSERT INTO staging.empleado (
    IdEmpleado,
    Apellido,
    Nombre,
    IdSucursal,
    IdSector,
    IdCargo,
    Salario
)
SELECT *
FROM raw.empleado
WHERE IdEmpleado NOT IN (
    SELECT IdEmpleado FROM staging.empleado_duplicados
);

DROP TABLE raw.empleado;