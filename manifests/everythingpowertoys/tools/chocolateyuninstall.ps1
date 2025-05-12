$ErrorActionPreference = 'Stop'; # stop on all errors
$zip = "Everything-_VERSION_-x64.zip"
if($env:PROCESSOR_ARCHITECTURE -eq "ARM64"){
  $zip = "Everything-_VERSION_-ARM64.zip"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  ZipFileName = $zip
}

Uninstall-ChocolateyZipPackage @packageArgs