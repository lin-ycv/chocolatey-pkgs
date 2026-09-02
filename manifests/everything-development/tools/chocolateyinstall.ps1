$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1423b.x86-Setup.exe'
  checksum = 'cd5b1814fef523d4dd9551233bdaf3094c4900c5cd57add16ad8fc61bf0059b9'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1423b.x64-Setup.exe'
  checksum64 = '7757474ed0ed74280959171c9d27fdddd7a8b00b764bc6c823ec1f6aa325e2ea'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
