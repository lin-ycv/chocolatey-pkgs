$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1408a.x86-Setup.exe'
  checksum = 'b5eaa519561202d38a4712416f7a09dedd783ae3903d8c873f5149db27a69064'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1408a.x64-Setup.exe'
  checksum64 = 'acd268b3c9120f3ee5e6e0b7641413739bb036da30eaabe27a1f7de4f67a7a7f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
