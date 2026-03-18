$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1407a.x86-Setup.exe'
  checksum = '80f0afe7fcd77650f0b95ebf7d805e4a93d86376aeb1bed3ed9855587c5acf5e'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1407a.x64-Setup.exe'
  checksum64 = '75c775160a19b9428ac319961b85f723d19a17105657f39d43e92347f64ea99d'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
