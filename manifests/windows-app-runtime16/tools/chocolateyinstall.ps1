$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall16.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
  packageName = $env:ChocolateyPackageName
  fileFullPath = "$env:TEMP\$filename"
  url = 'https://aka.ms/windowsappsdk/1.6/1.6.250402001/windowsappruntimeinstall-x86.exe'
  checksum = 'E9F5ACADACF400834395C760457FD2750376CC3931CEE805020608C84FF83488'
  checksumType = 'sha256'
  url64Bit = 'https://aka.ms/windowsappsdk/1.6/1.6.250228001/windowsappruntimeinstall-x64.exe'
  checksum64 = '94A9561AE2E679D0D63EBA522C152E88A4EBAC157843E2B9BBEDBD308F285AE0'
  checksumType64= 'sha256'
}
Get-ChocolateyWebFile @args

& $env:TEMP\$filename --quiet --force