$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall16.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
  packageName = $env:ChocolateyPackageName
  fileFullPath = "$env:TEMP\$filename"
  url = 'https://aka.ms/windowsappsdk/1.6/1.6.250430001/windowsappruntimeinstall-x86.exe'
  checksum = 'ffe442fcf261c7dc98fefb9c690924259d0df0211f1403c6f451d04afd5a0169'
  checksumType = 'sha256'
  url64Bit = 'https://aka.ms/windowsappsdk/1.6/1.6.250430001/windowsappruntimeinstall-x64.exe'
  checksum64 = '91afd354b53fb0215c71f22ab48441897cec3b315fd21a927bd2ce49ed1381e5'
  checksumType64= 'sha256'
}
Get-ChocolateyWebFile @args

& $env:TEMP\$filename --quiet --force
