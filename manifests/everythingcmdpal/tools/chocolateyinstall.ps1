$ErrorActionPreference = 'Stop'
Stop-Process -Name 'EverythingCmdPal' -ErrorAction SilentlyContinue

# update.ps1 maintains all four values; ARM64 is optional.
$url64 = 'https://github.com/lin-ycv/EverythingCommandPalette/releases/download/v0.1.0/VictorLin.EverythingCP_0.1.0.0_x64__yazqh14evg2ve.Msix'
$hash64 = 'c8fed72e7ff3cf59a01447b3bf2e200b55e8f03ee9d1c0b6b84db4e6b072340a'
$urlArm64 = ''
$hashArm64 = ''

$architecture = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString()
switch ($architecture) {
    'X64' { $url = $url64; $hash = $hash64 }
    'Arm64' {
        if ([string]::IsNullOrWhiteSpace($urlArm64)) { throw 'No native ARM64 MSIX in this release.' }
        $url = $urlArm64; $hash = $hashArm64
    }
    default { throw "Unsupported OS architecture: $architecture" }
}
if ([string]::IsNullOrWhiteSpace($url) -or $hash -notmatch '^[a-fA-F0-9]{64}$') {
    throw "Missing or invalid ECP installer data for $architecture."
}
$file = Join-Path $env:TEMP ('everythingcmdpal_{0}_{1}.Msix' -f $env:ChocolateyPackageVersion, $architecture)
$args = @{
    PackageName = 'everythingcmdpal'
    FileFullPath = $file
    Url64bit = $url
    Checksum64 = $hash
    ChecksumType64 = 'sha256'
}
$destinationPath = Get-ChocolateyWebFile @args
$escapedPath = $destinationPath.Replace("'", "''")
Start-ChocolateyProcessAsAdmin -ExeToRun 'powershell.exe' -Statements "-NoProfile -Command `"Add-AppxPackage -LiteralPath '$escapedPath'`""
Write-Host 'Reminder: PowerToys / Command Palette and Everything must be installed separately.'
