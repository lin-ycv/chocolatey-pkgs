$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1405a.x86-Setup.exe'
  checksum = '93d382af9e3b8a37d2f28ddeccdb1b1feb0dd246a7b3e5c97de0dac19f9ef0e4'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1405a.x64-Setup.exe'
  checksum64 = '89845bd88821c5dba7fcbf5cd2deb83d796ed0363d42ffdd62cefb34d4b8c431'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
