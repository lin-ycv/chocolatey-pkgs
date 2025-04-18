$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

switch($env:PROCESSOR_ARCHITECTURE){
        "ARM64" {
            $url = "https://aka.ms/windowsappsdk/1.6/1.6.250228001/windowsappruntimeinstall-arm64.exe"
            $expectedHash = "F8CA545767445E3892E6130F1E050907727094F10D14AC9C9911475D5254AEFE"
        }
        "x86" {
            $url = "https://aka.ms/windowsappsdk/1.6/1.6.250402001/windowsappruntimeinstall-x86.exe"
            $expectedHash = "E9F5ACADACF400834395C760457FD2750376CC3931CEE805020608C84FF83488"
        }
        default { #"AMD64"
            $url = "https://aka.ms/windowsappsdk/1.6/1.6.250228001/windowsappruntimeinstall-x64.exe"
            $expectedHash = "94A9561AE2E679D0D63EBA522C152E88A4EBAC157843E2B9BBEDBD308F285AE0"
        }
    }


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "--quiet"
  url         = $url
  validExitCodes= @(0)
  checksum    = $expectedHash
  checksumType= 'sha256'
}

Install-ChocolateyPackage @packageArgs