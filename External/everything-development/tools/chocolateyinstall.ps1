$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = "https://www.voidtools.com/Everything-1.5.0.1391a.x86-Setup.exe"
  checksum = "e53ded489fabd39c2b11c57e5c95ed2cd4e05a47160b696e6174a7a53c31c7fe"
  checksumType = "sha256"
  url64Bit = "https://www.voidtools.com/Everything-1.5.0.1391a.x64-Setup.exe"
  checksum64 = "08712d7f9e87cb8181664b58471ab4addde4396566acc15b57b6c7de24a0425a"
  checksumType64 = "sha256"
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs