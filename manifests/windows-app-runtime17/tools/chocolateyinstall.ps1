$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall17.exe"
#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
    packageName = $env:ChocolateyPackageName
    fileFullPath = "$env:TEMP\$filename"
    url = 'https://aka.ms/windowsappsdk/1.7/1.7.250401001/windowsappruntimeinstall-x86.exe'
    checksum = '053649c9be11516aaea53d9a9bdeda3342d7f24fbecf8c322777ff61cc832373'
    checksumType = 'sha256'
    url64Bit = 'https://aka.ms/windowsappsdk/1.7/1.7.250401001/windowsappruntimeinstall-x64.exe'
    checksum64 = '73536a05d990f5ae778ed5f046d58a9963511bb3c3e1baf0b5b1eaa43b5a1f32'
    checksumType64= 'sha256'
  }
  Get-ChocolateyWebFile @args
  
  & $env:TEMP\$filename --quiet --force