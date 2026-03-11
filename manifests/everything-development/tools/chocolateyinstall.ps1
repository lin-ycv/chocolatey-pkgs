$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1406a.x86-Setup.exe'
  checksum = 'c3b004eef1822c6c0cc035428490efbf385ffe81a880a0129b06596df6337a85'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1406a.x64-Setup.exe'
  checksum64 = 'd48cce5f841fb7ad0142feecfe746cb466a136b2d0253e31cec3b41660ad7b4d'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
