$ErrorActionPreference = 'Stop'
Stop-Process -Name 'EverythingCmdPal3' -ErrorAction SilentlyContinue

# update.ps1 maintains all four values; ARM64 is optional.
$url64 = 'https://github.com/lin-ycv/EverythingCommandPalette/releases/download/v0.12.26081.0/VictorLin.EverythingCP3_1.12.26082.0_x64__yazqh14evg2ve.Msix'
$hash64 = 'a77220f29a8deaae5aeb8781ab5818fc340bad29b4ba179b0552fc68a8266262'
$urlArm64 = 'https://github.com/lin-ycv/EverythingCommandPalette/releases/download/v0.12.26081.0/VictorLin.EverythingCP3_1.12.26082.0_arm64__yazqh14evg2ve.Msix'
$hashArm64 = 'e5f06b069ab70400ebcd49baef807603a4f035f167d3a9d58d0ed4be554af267'

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
    throw "Missing or invalid ECP3 installer data for $architecture."
}
$file = Join-Path $env:TEMP ('everythingcmdpal3_{0}_{1}.Msix' -f $env:ChocolateyPackageVersion, $architecture)
$args = @{
    PackageName = 'everythingcmdpal3'
    FileFullPath = $file
    Url64bit = $url
    Checksum64 = $hash
    ChecksumType64 = 'sha256'
}
$destinationPath = Get-ChocolateyWebFile @args
$escapedPath = $destinationPath.Replace("'", "''")
Start-ChocolateyProcessAsAdmin -ExeToRun 'powershell.exe' -Statements "-NoProfile -Command `"Add-AppxPackage -LiteralPath '$escapedPath'`""
Write-Host 'Reminder: PowerToys / Command Palette and Everything must be installed separately.'
