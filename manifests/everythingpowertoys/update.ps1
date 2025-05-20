Import-Module Chocolatey-AU

function global:au_GetLatest {
    $obj = Invoke-RestMethod -Uri "https://api.github.com/repos/lin-ycv/EverythingPowerToys/releases/latest" -UseBasicParsing
    $armhashpattern = "\s?ARM64-ZIP\s?\|\s?([a-zA-Z0-9]{64})"
    if (-not ($obj.body -match $armhashpattern)) {
        Write-Output "No hash for arm found."
        return
    }
    $armhash = $matches[1]
    $x64hashpattern = "\s?x64-ZIP\s?\|\s?([a-zA-Z0-9]{64})"
    if (-not ($obj.body -match $x64hashpattern)) {
        Write-Output "No hash for x64 found."
        return
    }
    $x64hash = $matches[1]
    $version = $obj.tag_name.trim('v')

    #returns into $Lastest
    @{
        Version = $version
        ARM64 = $obj.assets.browser_download_url | Where-Object { $_ -match "$version.*ARM64.zip" }
        URL64 = $obj.assets.browser_download_url | Where-Object { $_ -match "$version.*x64.zip" }
	    Checksum64 = $x64hash
	    Checksuma64 = $armhash
    }
}

function global:au_SearchReplace{
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\`$url\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(?i)(^\`$hash\s*=\s*)('[a-zA-Z0-9]{64}')" = "`$1'$($Latest.Checksum64)'"
            "(?i)(^[\s\t]+\`$url\s*=\s*)('.*')" = "`$1'$($Latest.ARM64)'"
            "(?i)(^[\s\t]+\`$hash\s*=\s*)('[a-zA-Z0-9]{64}')" = "`$1'$($Latest.Checksuma64)'"
        }
        ".\tools\chocolateyuninstall.ps1" = @{
            "(?i)(^\`$zip\s*=\s*'[a-zA-Z]*)-([0-9].[0-9]*.[0-9])(-x64.zip')" = "`$1-$($Latest.Version)`$3"
            "(?i)(^\s+\`$zip\s*=\s*'[a-zA-Z]*)-([0-9].[0-9]*.[0-9])(-ARM64.zip')" = "`$1-$($Latest.Version)`$3"
        }
    }
}

update -checksumfor none
#REF https://www.youtube.com/watch?v=SKRSqbpj31g
<#
$au_Force = $true; .\update.ps1 <- Run regardless if no new version
$au_NoCheckChocoVersion = $true; .\update.ps1 <- Run regardless of what version is published
#>