$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall17.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
    packageName = $env:ChocolateyPackageName
    fileFullPath = "$env:TEMP\$filename"
    url = 'https://aka.ms/windowsappsdk/1.7/1.7.251107005/windowsappruntimeinstall-x86.exe'
    checksum = 'beb08acf0a9846f6da8ac470f9be1afaa04bc50f6f41f49d022a97674a47a412'
    checksumType = 'sha256'
    url64Bit = 'https://aka.ms/windowsappsdk/1.7/1.7.251107005/windowsappruntimeinstall-x64.exe'
    checksum64 = '1ce28d3783da984802bf2ce4126a08a9c6e46be236616458b5d948241818789e'
    checksumType64= 'sha256'
  }
  Get-ChocolateyWebFile @args
  
  & $env:TEMP\$filename --quiet --force
