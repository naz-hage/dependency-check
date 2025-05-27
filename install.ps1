# This script downloads and extracts the Dependency Check tool from GitHub.
# It assumes that the user has the necessary permissions to create directories and download files.
. "$PSScriptRoot\config.ps1"

$uri="https://github.com/jeremylong/DependencyCheck/releases/download/v$version/dependency-check-$version-release.zip"
try {
    Invoke-WebRequest -Uri $uri -OutFile $downloadFile
} catch {
    Write-Error "Failed to download file from $uri. Error: $_"
    exit 1
}



# Extract the downloaded zip file
Expand-Archive -Path $downloadFile -DestinationPath $installedPath -Force

Write-Host "Dependency Check version $version has been downloaded and extracted to $installedPath."