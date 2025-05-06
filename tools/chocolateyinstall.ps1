$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$url = "https://www.voidtools.com/Everything-1.5.0.1391a.x86-Setup.exe"
$url64 = "https://www.voidtools.com/Everything-1.5.0.1391a.x64-Setup.exe"

Install-ChocolateyPackage -PackageName 'Everything Alpha' -FileType 'exe' -SilentArgs '/S' -Url $url -Url64bit $url64 