stop-process -Name "PowerToys"

$ErrorActionPreference = 'Stop';
$url        = '_URL_'
$hash       = '_CRC'

if($env:PROCESSOR_ARCHITECTURE -eq "ARM64"){
        $url = '_URLARM_'
        $hash = '_CRCARM_'
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
