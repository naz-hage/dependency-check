# This scripts sets up the configuration for the Dependency-Check tool.
# It defines the version, download folder, and paths for the tool's executable.
$version = "12.1.0"
$uri="https://github.com/dependency-check/DependencyCheck/releases/download/v$version/dependency-check-$version-release.zip"
$downloadsFolder = "$env:USERPROFILE\dependency-check-downloads"
if (-not (Test-Path -Path $downloadsFolder)) {
    New-Item -ItemType Directory -Path $downloadsFolder | Out-Null
}
$downloadFile = "$downloadsFolder\dependency-check-$version-release.zip"

$installedPath = "$downloadsFolder\dependency-check-$version"

$dependencyCheckScan = Join-Path -Path $installedPath -ChildPath "dependency-check\bin\dependency-check.bat"

Write-Host "version: $version"
Write-Host "uri: $uri"
Write-Host "downloadsFolder: $downloadsFolder"
Write-Host "downloadFile: $downloadFile"
Write-Host "installedPath: $installedPath"
Write-Host "dependencyCheckScan: $dependencyCheckScan"