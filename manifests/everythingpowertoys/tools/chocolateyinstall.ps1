$ErrorActionPreference = 'Stop'
stop-process -Name "PowerToys" -ErrorAction SilentlyContinue > $null

$url        = 'https://github.com/lin-ycv/EverythingPowerToys/releases/download/v0.91.1/EverythingPT-0.91.1-x64.zip'
$hash       = '1ab45af0a4e8c39dd355a7264629911ab14ab12f3231a49849a69c0570de8790'

if($env:PROCESSOR_ARCHITECTURE -eq "ARM64"){
        $url = 'https://github.com/lin-ycv/EverythingPowerToys/releases/download/v0.91.1/EverythingPT-0.91.1-ARM64.zip'
        $hash = '67762f69d55af8efb13c36e21a3bf484d2efa49285a28e05975d64cddc508c98'
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$env:LOCALAPPDATA\\Microsoft\\PowerToys\\PowerToys Run\\Plugins\\"
  url           = $url

  softwareName  = 'EverythingPowerToys*'

  checksum      = $hash
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
