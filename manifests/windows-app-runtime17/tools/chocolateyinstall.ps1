$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall17.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
    packageName = $env:ChocolateyPackageName
    fileFullPath = "$env:TEMP\$filename"
    url = 'https://aka.ms/windowsappsdk/1.7/1.7.251014001/windowsappruntimeinstall-x86.exe'
    checksum = '479b4a7499c000500017c8c20bbde5e21f7759b6d3f2660107d40ca4db938e47'
    checksumType = 'sha256'
    url64Bit = 'https://aka.ms/windowsappsdk/1.7/1.7.251014001/windowsappruntimeinstall-x64.exe'
    checksum64 = 'b1904c8ce2cfb7c8bc28cb094f8fe47c06ccf47eb6d46abc8e1ef17d3cbf91a6'
    checksumType64= 'sha256'
  }
  Get-ChocolateyWebFile @args
  
  & $env:TEMP\$filename --quiet --force
