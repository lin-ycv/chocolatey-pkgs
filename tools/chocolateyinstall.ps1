$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Stop-Process -Name "EverythingCmdPal" -ErrorAction SilentlyContinue
$url = "https://github.com/lin-ycv/EverythingCommandPalette/releases/download/v0.1.0/VictorLin.EverythingCP_0.1.0.0_x64__yazqh14evg2ve.Msix"
$expectedHash = "c8fed72e7ff3cf59a01447b3bf2e200b55e8f03ee9d1c0b6b84db4e6b072340a"
$newFileName = "ecp_0.1.0_.msix"
$destinationPath = Join-Path -Path $toolsDir -ChildPath $newFileName

if($env:PROCESSOR_ARCHITECTURE -eq "ARM64"){
        $url = "https://github.com/lin-ycv/EverythingCommandPalette/releases/download/v0.1.0/VictorLin.EverythingCP_0.1.0.0_ARM64__yazqh14evg2ve.Msix"
        $expectedHash = "265cf2bd75d49081757c3da59aa8cd6e139470a88d2c3e6cecc52a0b010fc5dc"
}
Get-ChocolateyWebFile -PackageName 'Everything Command Palette' -FileFullPath "$destinationPath" -Url64 "$url" -Checksum64 "$expectedHash" -ChecksumType64 "sha256"

# Works but outputs wall of red text https://github.com/chocolatey/choco/issues/1016
# $command = "Add-AppxPackage `"$destinationPath`""
# Start-ChocolateyProcessAsAdmin "& $command"
# Write-Host "Reminder: PowerToys/Command Palette and Everything needs to be installed separately" -ForegroundColor Yellow

# This doesn't output wall of red, but requires a new powershell https://www.reddit.com/r/PowerShell/comments/1g03x2u/getappxpackage_error_24h2/
$command = "Add-AppxPackage `"$destinationPath`""
$erout = Join-Path -Path $toolsDir -ChildPath "ecp.log"
Start-Process powershell.exe `
  -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `$command = `"$command`"; Invoke-Expression `$command 2>`'$($erout)'" `
  -Verb RunAs `
  -Wait
if((Get-Item $erout).Length -gt 0){ throw "Some error happened during install, see log: $erout" }
else{
    Get-ChildItem -Path "$tempPath\ecp-*.log" -ErrorAction SilentlyContinue | Remove-Item -Force
    Write-Host "Reminder: PowerToys/Command Palette and Everything needs to be installed separately" -ForegroundColor Yellow
}