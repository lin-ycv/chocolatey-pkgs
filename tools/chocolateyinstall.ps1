$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$url = "https://www.voidtools.com/Everything-1.5.0.1391a.x86-Setup.exe"
$hash = "e53ded489fabd39c2b11c57e5c95ed2cd4e05a47160b696e6174a7a53c31c7fe"
$url64 = "https://www.voidtools.com/Everything-1.5.0.1391a.x64-Setup.exe"
$hash64 = "08712d7f9e87cb8181664b58471ab4addde4396566acc15b57b6c7de24a0425a"

Install-ChocolateyPackage -PackageName 'Everything Development' -FileType 'exe' -SilentArgs '/S' -Url $url -Checksum $hash -ChecksumType 'sha256' -Url64bit $url64 -Checksum64 $hash64 -ChecksumType64 'sha256'