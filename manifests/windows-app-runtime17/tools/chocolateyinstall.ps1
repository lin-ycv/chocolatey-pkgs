$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall17.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
    packageName = $env:ChocolateyPackageName
    fileFullPath = "$env:TEMP\$filename"
    url = 'https://aka.ms/windowsappsdk/1.7/1.7.260208005/windowsappruntimeinstall-x86.exe'
    checksum = 'a73553ad610fbbec6770df7b7f17faf04b553af80eb3008706e6f1fbac367ad2'
    checksumType = 'sha256'
    url64Bit = 'https://aka.ms/windowsappsdk/1.7/1.7.260208005/windowsappruntimeinstall-x64.exe'
    checksum64 = '43f0292415f7dd4c8a9b99adc2fde600dcde615db4e5daf4887979f5d8002e2c'
    checksumType64= 'sha256'
  }
  Get-ChocolateyWebFile @args
  
  & $env:TEMP\$filename --quiet --force
