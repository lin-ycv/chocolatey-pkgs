$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Everything Alpha'
  fileType       = 'exe'
  file           = Get-Item "$toolsDir\*x86*.exe"
  file64         = Get-Item "$toolsDir\*x64*.exe"
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs