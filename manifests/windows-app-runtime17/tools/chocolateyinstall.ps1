$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall17.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
    packageName = $env:ChocolateyPackageName
    fileFullPath = "$env:TEMP\$filename"
    url = 'https://aka.ms/windowsappsdk/1.7/1.7.260114001/windowsappruntimeinstall-x86.exe'
    checksum = '968e7816fc1fdb31d36589a5886ba5c80d5e439f5da43c93fc88d9682023e053'
    checksumType = 'sha256'
    url64Bit = 'https://aka.ms/windowsappsdk/1.7/1.7.260114001/windowsappruntimeinstall-x64.exe'
    checksum64 = '5d14920ecd5f766437d263ea53e21a0a8b6b58835ed494bc47b25a5c58b22915'
    checksumType64= 'sha256'
  }
  Get-ChocolateyWebFile @args
  
  & $env:TEMP\$filename --quiet --force
