$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1402a.x86-Setup.exe'
  checksum = '97e77d2a9f62c9e7adb89c754bc7062195d141ea70e94afb18c041fa57c8a4e7'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1402a.x64-Setup.exe'
  checksum64 = '2a078eab6606b95ff0cafe986b1d6919829c20ab5e41c502f8ce2c617796001a'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
