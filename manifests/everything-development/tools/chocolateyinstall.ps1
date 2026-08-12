$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1420b.x86-Setup.exe'
  checksum = 'abff79fb27af428d0482bce483aeb4b23819d3dd55d7e7be4b17bbfe825f3d78'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1420b.x64-Setup.exe'
  checksum64 = '995804de3ab698a1edac1f6b87e80c61953241b76854a4154e7f1087942b9f28'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
