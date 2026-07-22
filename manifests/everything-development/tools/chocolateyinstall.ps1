$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1418b.x86-Setup.exe'
  checksum = 'ced1a2f38df1c375eac29448c23b2903e40d579e4a249146824d018ea1f1b937'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1418b.x64-Setup.exe'
  checksum64 = '1b012d383a2fcc3998a13f8ab12d80113ed21685451f000814af656c044a9e8f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
