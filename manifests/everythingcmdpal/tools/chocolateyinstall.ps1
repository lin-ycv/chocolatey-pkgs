$ErrorActionPreference = 'Stop' # stop on all errors

Stop-Process -Name "EverythingCmdPal" -ErrorAction SilentlyContinue
$url = 'https://github.com/lin-ycv/EverythingCommandPalette/releases/download/v0.1.0/VictorLin.EverythingCP_0.1.0.0_x64__yazqh14evg2ve.Msix'
$hash = 'c8fed72e7ff3cf59a01447b3bf2e200b55e8f03ee9d1c0b6b84db4e6b072340a'

if($env:PROCESSOR_ARCHITECTURE -eq "ARM64"){
        $url = 'https://github.com/lin-ycv/EverythingCommandPalette/releases/download/v0.1.0/VictorLin.EverythingCP_0.1.0.0_ARM64__yazqh14evg2ve.Msix'
        $hash = '265cf2bd75d49081757c3da59aa8cd6e139470a88d2c3e6cecc52a0b010fc5dc'
}

$packageArgs = @{
        PackageName = 'Everything Command Palette'
        FileFullPath = Join-Path $env:TEMP "$($packageName)_$($packageVersion).Msix"
        Url64bit = $url
        Checksum64 = $hash
        ChecksumType64 = 'sha256'
}

$destinationPath = Get-ChocolateyWebFile @packageArgs

Start-ChocolateyProcessAsAdmin -ExeToRun "powershell.exe" -Statements "-Command `"Add-AppxPackage $destinationPath`""
Write-Host "Reminder: PowerToys/Command Palette and Everything needs to be installed separately" -ForegroundColor Yellow