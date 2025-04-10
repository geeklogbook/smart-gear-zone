$mysqlHost = "127.0.0.1"
$mysqlPort = "3306"
$mysqlUser = "user"
$mysqlPassword = "password"

$sqlFiles = @(
    "c:\Users\h\Documents\geeklogbook\202504\smart-gear-zone\queries\1.CreateRawTables.sql",
    "c:\Users\h\Documents\geeklogbook\202504\smart-gear-zone\queries\3.CreateStagingTables.sql"
)

$dockerContainerName = "mysqldb" 

foreach ($sqlFile in $sqlFiles) {
    Write-Host "Ejecutando $sqlFile"
    $sqlContent = Get-Content -Path $sqlFile -Raw
    $command = "docker exec -i $dockerContainerName mysql --host=$mysqlHost --port=$mysqlPort --user=$mysqlUser --password=$mysqlPassword -e `"$sqlContent`""
    Invoke-Expression $command
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error al ejecutar $sqlFile" -ForegroundColor Red
        exit $LASTEXITCODE
    }
    Write-Host "$sqlFile ejecutado correctamente." -ForegroundColor Green
}

Write-Host "SCRIPTS EXECUTED" -ForegroundColor Green