$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall16.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
  packageName = $env:ChocolateyPackageName
  fileFullPath = "$env:TEMP\$filename"
  url = 'https://aka.ms/windowsappsdk/1.6/1.6.250602001/windowsappruntimeinstall-x86.exe'
  checksum = '6219474e62cdc52509df78c31943e61cb896e10517602dd7d55b9b8a9a0b79c7'
  checksumType = 'sha256'
  url64Bit = 'https://aka.ms/windowsappsdk/1.6/1.6.250602001/windowsappruntimeinstall-x64.exe'
  checksum64 = 'c7cd988425b76ea087e2e1d7b096b585f853e20bb826b8f38d45a5175410a877'
  checksumType64= 'sha256'
}
Get-ChocolateyWebFile @args

& $env:TEMP\$filename --quiet --force
