$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1415b.x86-Setup.exe'
  checksum = '8cb20eb74da2f86d9d9e9b1871e5ea6eb7d83de675775a6145ac0211dcef15e1'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1415b.x64-Setup.exe'
  checksum64 = 'ab76b4f9b756ffd808950c99b5dc0da666985d4b6907e22fe72c0640b6f0abad'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
