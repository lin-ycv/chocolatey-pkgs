$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall17.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
    packageName = $env:ChocolateyPackageName
    fileFullPath = "$env:TEMP\$filename"
    url = 'https://aka.ms/windowsappsdk/1.7/1.7.260224002/windowsappruntimeinstall-x86.exe'
    checksum = '470b6fe2db339b90b845c90c3368f39b38b15e1a4d3dc7aebea5fa12f1483169'
    checksumType = 'sha256'
    url64Bit = 'https://aka.ms/windowsappsdk/1.7/1.7.260224002/windowsappruntimeinstall-x64.exe'
    checksum64 = '8de73b13a010c6aeb84040e5587a46d21b36decce0ccd582c346536cad63ae73'
    checksumType64= 'sha256'
  }
  Get-ChocolateyWebFile @args
  
  & $env:TEMP\$filename --quiet --force
