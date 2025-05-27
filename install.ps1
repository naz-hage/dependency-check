$version = "12.1.0"
$downloadFile = "dependency-check-$version-release.zip"
$uri="https://github.com/jeremylong/DependencyCheck/releases/download/v$version/dependency-check-12.1.0-release.zip"
Invoke-WebRequest -Uri $uri -OutFile $downloadFile
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to download file from $uri"
    exit 1
}

# Extract the downloaded zip file
Expand-Archive -Path $downloadFile -DestinationPath "dependency-check-$version" -Force