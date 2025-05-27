$version = "12.1.0"
$downloadsFolder = "$env:USERPROFILE\dependency-check-downloads"
if (-not (Test-Path -Path $downloadsFolder)) {
    New-Item -ItemType Directory -Path $downloadsFolder | Out-Null
}
$downloadFile = "$downloadsFolder\dependency-check-$version-release.zip"

$installedPath = "$downloadsFolder\dependency-check-$version"
Write-Host "version: $version"
Write-Host "downloadsFolder: $downloadsFolder"
Write-Host "downloadFile: $downloadFile"
Write-Host "installedPath: $installedPath"