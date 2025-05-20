$ErrorActionPreference = 'Stop'
stop-process -Name "PowerToys" -ErrorAction SilentlyContinue > $null

$url        = 'https://github.com/lin-ycv/EverythingPowerToys/releases/download/v0.89.0/EverythingPT-0.89.0-x64.zip'
$hash       = '4eb7e839e8ef4c3eb81dcc48d927cb1f9c761b2c25eb1b41a453c08879012353'

if($env:PROCESSOR_ARCHITECTURE -eq "ARM64"){
        $url = 'https://github.com/lin-ycv/EverythingPowerToys/releases/download/v0.89.0/EverythingPT-0.89.0-ARM64.zip'
        $hash = '4d71bfe94942942911d2dd6ffce9d42e5a977e6289c0b199ba2e0282a9f7f4ba'
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
