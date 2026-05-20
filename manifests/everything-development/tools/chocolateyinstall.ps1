$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1409a.x86-Setup.exe'
  checksum = 'bcbcfa93637635031befeb17d85c02bcd6132aaef311e3867848b24598188a3b'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1409a.x64-Setup.exe'
  checksum64 = 'f4141abfb80f799c467b1e94409cb13cb1fde6663eb473c5ea3ce876b6f183e4'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
