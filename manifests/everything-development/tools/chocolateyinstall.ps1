$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1416b.x86-Setup.exe'
  checksum = 'bf1cb13a43a7f2ca9e546f4d5010e9cc726e1a132b87e09976f6bb638b03a3a4'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1416b.x64-Setup.exe'
  checksum64 = '25a896740360dff86815b09cba9e5c74ac0eec96abce81ad99828b77a86e921d'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
