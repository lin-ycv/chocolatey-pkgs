$ErrorActionPreference = 'Stop'
# Exact identity: do not remove both ECP and ECP3.
$command = "Get-AppxPackage -Name 'VictorLin.EverythingCP' | Remove-AppxPackage"
Start-ChocolateyProcessAsAdmin -ExeToRun 'powershell.exe' -Statements "-NoProfile -Command `"$command`""
