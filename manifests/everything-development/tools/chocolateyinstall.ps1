$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1422b.x86-Setup.exe'
  checksum = '558c7af468da4d422663607232bcb65e707a69b5da5196ec05594498c8cf08ec'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1422b.x64-Setup.exe'
  checksum64 = '5166d1231d8ebecba6c2e2407d001d6ca634e42897353288caf11058a0fe1004'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
