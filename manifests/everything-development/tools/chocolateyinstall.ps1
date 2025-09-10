$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1399a.x86-Setup.exe'
  checksum = '64651b45af55152930c17c447bfcb09a5e3677d74d493dfab9efcd28508f2906'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1399a.x64-Setup.exe'
  checksum64 = '72ba321b858f2b2dc476eb49a2165fd633197578b3cf2841d23770a6668c9d2f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
