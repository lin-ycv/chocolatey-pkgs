Import-Module Chocolatey-AU

function global:au_GetLatest {
    $url = "https://www.voidtools.com/"
    $html = Invoke-RestMethod -Uri ($url+"everything-1.5a/") -UseBasicParsing
    $vPattern = "Download Everything ([0-9\.]+)a"
    if (-not ($html -match $vPattern)) {
        Write-Output "No version found."
        return
    }
    $version = $matches[1]
    $pre = ($url+"Everything-"+$version+"a.x")
    $exe = "-Setup.exe"

    #returns into $Lastest
    @{
        Version = $version
        URL32 = ($pre+"86"+$exe)
        URL64 = ($pre+"64"+$exe)
    }
}

function global:au_SearchReplace{
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
            "(?i)(^\s*url64Bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

update
#REF https://www.youtube.com/watch?v=SKRSqbpj31g
<#
$au_Force = $true; .\update.ps1 <- Run regardless if no new version
$au_NoCheckChocoVersion = $true; .\update.ps1 <- Run regardless of what version is published
#>