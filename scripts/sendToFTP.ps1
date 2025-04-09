$ftpServer = "127.0.0.1" 
$ftpPort = "21"          
$ftpUser = "user"        
$ftpPassword = "password" 
$localFolder = "c:\Users\h\Documents\geeklogbook\202504\smart-gear-zone\data\sources" 
$remoteFolder = "/"      

# Subir cada archivo CSV al servidor FTP
Get-ChildItem -Path $localFolder -Filter *.csv | ForEach-Object {
    $localFile = $_.FullName
    $remoteFile = "$remoteFolder/$($_.Name)"
    Write-Host "Subiendo $localFile a $remoteFile..."

    # Crear la sesión FTP
    $ftpUri = "ftp://${ftpServer}:${ftpPort}$remoteFile"
    $ftpRequest = [System.Net.FtpWebRequest]::Create($ftpUri)
    $ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
    $ftpRequest.Credentials = New-Object System.Net.NetworkCredential($ftpUser, $ftpPassword)

    # Leer el archivo local y subirlo
    $fileContent = Get-Content -Path $localFile -Encoding Byte
    $ftpRequest.ContentLength = $fileContent.Length
    $requestStream = $ftpRequest.GetRequestStream()
    $requestStream.Write($fileContent, 0, $fileContent.Length)
    $requestStream.Close()

    # Confirmar la respuesta del servidor
    $ftpResponse = $ftpRequest.GetResponse()
    Write-Host "Archivo $localFile subido correctamente."
    $ftpResponse.Close()
}

Write-Host "Todos los archivos CSV se han subido al servidor FTP."
