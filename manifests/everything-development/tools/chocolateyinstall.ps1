$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1413b.x86-Setup.exe'
  checksum = '36514300ab65e21eb7bc534c1eccc4f82afa8545db3496d281e12844e59763f1'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1413b.x64-Setup.exe'
  checksum64 = '33aaad9a14de4864b3b1c49ea4e3ee58810fab925bc1f8de0b622bf5caaba017'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
