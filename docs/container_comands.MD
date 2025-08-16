# 1 - Copiar archivos CSV al contenedor
```
docker cp data/ mysql-local:/var/lib/mysql-files/
```

# 2- Ejecutar los SQL para cada tabla

* Windows: `Get-Content queries/1.CreateRawTables.sql | docker exec -i mysql-local mysql -u root -prootpassword`
* Linux: `cat queries/1.CreateRawTables.sql | docker exec -i mysql-local mysql -u root -prootpassword`

## 1 Create Raw Tables

`Get-Content queries/1.CreateRawTables.sql | docker exec -i mysql-local mysql -u root -prootpassword`

## 2 Load Raw Data Local

`Get-Content queries/2.LoadRawDataLocal.sql | docker exec -i mysql-local mysql -u root -prootpassword --local-infile=1`

## 3 Create Staging Tables

`Get-Content queries/3.CreateStagingTables.sql | docker exec -i mysql-local mysql -u root -prootpassword`

## 4 Create Calendar Table

`Get-Content queries/4.CreateCalendarTable.sql | docker exec -i mysql-local mysql -u root -prootpassword`

## 5 Function Sanitize Title Case

`Get-Content queries/5.FunctionSanitizeTitleCase.sql | docker exec -i mysql-local mysql -u root -prootpassword`