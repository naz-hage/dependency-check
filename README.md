# Dependency Check

This repository provides a template for running dependency vulnerability checks using the NVD API.

## Setup Instructions

1. **Obtain an NVD API Key**  
   Register for an API key at [NVD Developers](https://nvd.nist.gov/developers/vulnerabilities).

2. **Set the API Key as an Environment Variable**  
   Add your key to your environment variables as `NVD_API_KEY`.

3. **Configure the Scan Script**  
   Edit `.scan.ps1` to specify the path to your project directory.

4. **Run the Scan**  
   Execute the script in PowerShell:
   ```powershell
   .\.scan.ps1
   ```
