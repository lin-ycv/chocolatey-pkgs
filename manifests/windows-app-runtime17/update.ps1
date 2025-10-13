Import-Module Chocolatey-AU

function global:au_GetLatest {
    $url = "https://github.com/MicrosoftDocs/windows-dev-docs/raw/refs/heads/docs/hub/apps/windows-app-sdk/downloads-archive.md"
    $html = Invoke-RestMethod -Uri $url -UseBasicParsing
    $vPattern = "\|\s?\[(1.7.\d+)\s?\("
    if (-not ($html -match $vPattern)) {
        Write-Output "No version found."
        return
    }
    $version = $matches[1]
    $bPattern = "\|\s?\[1.7.\d+\s?\((1.7.\d+)\)"
    $html -match $bPattern
    $build = $matches[1]
    $pre = ("https://aka.ms/windowsappsdk/1.7/"+$build+"/windowsappruntimeinstall-")

    #returns into $Lastest
    @{
        Version = $version
        URL32 = ($pre+"x86.exe")
        URL64 = ($pre+"x64.exe")
    }
}

function global:au_SearchReplace{
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*url64Bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update
#REF https://www.youtube.com/watch?v=SKRSqbpj31g
<#
$au_Force = $true; .\update.ps1 <- Run regardless if no new version
$au_NoCheckChocoVersion = $true; .\update.ps1 <- Run regardless of what version is published
#>