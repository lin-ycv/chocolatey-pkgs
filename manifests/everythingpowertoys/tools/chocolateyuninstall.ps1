$ErrorActionPreference = 'Stop';
$zip = 'EverythingPT-0.91.1-x64.zip'
if($env:PROCESSOR_ARCHITECTURE -eq "ARM64"){
  $zip = 'EverythingPT-0.91.1-ARM64.zip'
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  ZipFileName = $zip
}

Uninstall-ChocolateyZipPackage @packageArgs
