# This script scans a project using the Dependency Check tool.
# It requires the NVD_API_KEY environment variable to be set for accessing the NVD API.
# Required Parameters:
# - ProjectName: Name of the project to be scanned.
# - ScanPath: Path to the project directory to be scanned.
# - ReportFormat: Format of the report to be generated (default is HTML).
# - OutputDir: Directory where the report will be saved (default is "minikube-report"). 

param(
  [Parameter(Mandatory=$true)]
  [string]$ProjectName = "minikube",
  
  [Parameter(Mandatory=$true)]
  [string]$ScanPath = "C:\source\minikube",
  
  [Parameter(Mandatory=$false)]
  [string]$ReportFormat = "HTML",
  
  [Parameter(Mandatory=$true)]
  [string]$OutputDir 
)

. "$PSScriptRoot\config.ps1"

# if output directory is not specified, use the default "minikube-report"
$OutputDir = Join-Path -Path $installedPath -ChildPath $OutputDir

if (-not $env:NVD_API_KEY) {
  Write-Error "NVD_API_KEY environment variable is not set. Please set it and try again."
  exit 1
}

Write-Host "NVD_API_KEY is set, proceeding with the scan."

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
