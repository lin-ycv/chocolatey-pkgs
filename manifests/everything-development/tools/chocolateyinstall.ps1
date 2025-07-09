$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1396a.x86-Setup.exe'
  checksum = '79447a25a593adcbdc451b6c8c82970c509d8988f516427e6a26f44f21df89bb'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1396a.x64-Setup.exe'
  checksum64 = '37f8f9359346b78a5e9820b5bae73044366a299eaaeba2d8a56fadf46bcc577e'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
