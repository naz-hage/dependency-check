param(
  [string]$ProjectName = "minikube",
  [string]$ScanPath = "C:\source\minikube",
  [string]$ReportFormat = "HTML",
  [string]$OutputDir = "minikube-report"
)

. "$PSScriptRoot\config.ps1"

if (-not $env:NVD_API_KEY) {
  Write-Error "NVD_API_KEY environment variable is not set. Please set it and try again."
  exit 1
}

Write-Host "NVD_API_KEY is set, proceeding with the scan."

$dependencyCheckScan = "$installedPath\dependency-check\bin\dependency-check.bat"

if (-not (Test-Path -Path $dependencyCheckScan)) {
  Write-Error "Dependency Check executable does not exist at $dependencyCheckScan. Please ensure it is installed correctly."
  exit 1
}

if (-not (Test-Path -Path $ScanPath)) {
  Write-Error "Scan path does not exist: $ScanPath"
  exit 1
}

& $dependencyCheckScan `
  --project $ProjectName `
  --scan $ScanPath `
  --format $ReportFormat `
  --out $OutputDir `
  --nvdApiKey $env:NVD_API_KEY  `
  --nvdApiDelay 6000
if ($LASTEXITCODE -ne 0) {
  Write-Error "Dependency Check scan failed with exit code $LASTEXITCODE. Please check the tool's output for more details."
  exit $LASTEXITCODE
}
