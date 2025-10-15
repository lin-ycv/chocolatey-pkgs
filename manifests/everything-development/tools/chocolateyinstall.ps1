$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1400a.x86-Setup.exe'
  checksum = '82bd218efb8ff907af51e9d652e858eafdaf2b1434560cae42361c10a7932f34'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1400a.x64-Setup.exe'
  checksum64 = 'a63e523f22a2d1866a0ccf98e6df129d53d9a98b884b03b27dbd6c7059d2cdf8'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
