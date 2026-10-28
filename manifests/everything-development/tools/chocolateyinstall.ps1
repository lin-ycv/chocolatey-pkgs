$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1424b.x86-Setup.exe'
  checksum = '4d4e951775fb35db25d23eeea11184a5eed72c76099bf555bddcd76592877cb2'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1424b.x64-Setup.exe'
  checksum64 = 'ca2b380da56fbbe4a52332ec451a5c88c36d98c795be01f6f43730bb6db86652'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
