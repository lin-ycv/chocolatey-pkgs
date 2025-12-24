$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1404a.x86-Setup.exe'
  checksum = 'd9825fdc89e00fbf587fe9a175f6104ead7ae739d932428eb80e4a1001b0b812'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1404a.x64-Setup.exe'
  checksum64 = 'cf28b4b73674ce3d6c8de0fb0e3514c0f802ea5c172bb6dd3ebb27e8d7163ef3'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
