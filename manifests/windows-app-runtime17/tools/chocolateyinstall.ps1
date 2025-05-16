$ErrorActionPreference = 'Stop' # stop on all errors

$filename = "windowsappruntimeinstall17.exe"
switch($env:PROCESSOR_ARCHITECTURE){
        "ARM64" {
            $url = "https://aka.ms/windowsappsdk/1.7/1.7.250401001/windowsappruntimeinstall-arm64.exe"
            $expectedHash = "c507f631e8d0748cea7293059c971bc99815bf10b7df67422a3418115dee88f1"
        }
        "x86" {
            $url = "https://aka.ms/windowsappsdk/1.7/1.7.250401001/windowsappruntimeinstall-x86.exe"
            $expectedHash = "053649c9be11516aaea53d9a9bdeda3342d7f24fbecf8c322777ff61cc832373"
        }
        default { #"AMD64"
            $url = "https://aka.ms/windowsappsdk/1.7/1.7.250401001/windowsappruntimeinstall-x64.exe"
            $expectedHash = "73536a05d990f5ae778ed5f046d58a9963511bb3c3e1baf0b5b1eaa43b5a1f32"
        }
    }

#Install-ChocolateyPackage puts silent arg outside of filepath ("install.exe" "--quiet"), but it needs to be inside ("install.exe --quiet"), so download and execute separately

$args = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$env:TEMP\$filename"
  url         = $url
  checksum    = $expectedHash
  checksumType= 'sha256'
}
Get-ChocolateyWebFile @args

& $env:TEMP\$filename --quiet --force