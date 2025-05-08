$ErrorActionPreference = 'Stop'

$packageName         = 'Everything Development'
$softwareNamePattern = 'Everything *'


[array] $key = Get-UninstallRegistryKey $softwareNamePattern
if ($key.Count -eq 1) {
    $key | ForEach-Object {
        $key.UninstallString
        $packageArgs = @{
            packageName            = $packageName
            silentArgs             = "-unsetup -silent"
            fileType               = 'EXE'
            validExitCodes         = @(0)
            file                   = ''
        }
        $packageArgs.file = "$($_.UninstallString.Replace(' -unsetup', ''))"   #C:\Program Files\Everything 1.5a\Everything64.exe -unsetup
        Uninstall-ChocolateyPackage @packageArgs
    }
}
elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($key.Count -gt 1) {
    Write-Warning "$key.Count matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
}