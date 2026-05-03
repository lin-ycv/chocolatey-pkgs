Import-Module Chocolatey-AU

function global:au_GetLatest {
    $obj = Invoke-RestMethod -Uri "https://api.github.com/repos/lin-ycv/EverythingCommandPalette/releases/latest" -UseBasicParsing
    $x64hashpattern = "sha256:([a-zA-Z0-9]{64})"
    if (-not ($obj.assets.digest -match $x64hashpattern)) {
        Write-Output "No hash for x64 found."
        return
    }
    $x64hash = $matches[1]
    $version = $obj.tag_name.trim('v')

    #returns into $Lastest
    @{
        Version = $version
        URL64 = $obj.assets.browser_download_url | Where-Object { $_ -match "$version.*x64" }
	    Checksum64 = $x64hash
    }
}

function global:au_SearchReplace{
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\`$url\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\`$hash\s*=\s*)('[a-zA-Z0-9]{64}')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -checksumfor none
#REF https://www.youtube.com/watch?v=SKRSqbpj31g
<#
$au_Force = $true; .\update.ps1 <- Run regardless if no new version
$au_NoCheckChocoVersion = $true; .\update.ps1 <- Run regardless of what version is published
#>