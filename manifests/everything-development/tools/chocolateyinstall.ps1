$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Beta'
  fileType       = 'exe'
  url = 'https://www.voidtools.com/Everything-1.5.0.1414b.x86-Setup.exe'
  checksum = 'fd18578d3bf90b5a67ca77e704ccf49872f887c3f3e35b8d61e31b91c44d25ec'
  checksumType = 'sha256'
  url64Bit = 'https://www.voidtools.com/Everything-1.5.0.1414b.x64-Setup.exe'
  checksum64 = '604a748ce1ed880cb9d80f9c616bb970cc0025d282c925e51ac9678482be5c11'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
