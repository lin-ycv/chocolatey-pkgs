Import-Module Chocolatey-AU

function global:au_GetLatest {
    $downloadsUrl = 'https://www.voidtools.com/downloads/'
    $baseUri = [uri]$downloadsUrl
    # Only match multilingual beta EXE installers, not ZIP, MSI, Lite, or en-US builds.
    $installerPattern = '^Everything-(?<version>1\.5\.\d+\.\d+)b\.(?<arch>x86|x64)-Setup\.exe$'

    # Retry both network failures and temporary HTML maintenance pages.
    for ($attempt = 1; $attempt -le 3; $attempt++) {
        try {
            $response = Invoke-WebRequest -Uri $downloadsUrl -UseBasicParsing -ErrorAction Stop
            $installers = @(
                foreach ($link in $response.Links) {
                    if (-not $link.href) { continue }

                    $downloadUri = [uri]::new($baseUri, [string]$link.href)
                    if ($downloadUri.Scheme -ne 'https' -or $downloadUri.Host -ne $baseUri.Host) {
                        continue
                    }

                    $fileName = [uri]::UnescapeDataString([IO.Path]::GetFileName($downloadUri.AbsolutePath))
                    if ($fileName -match $installerPattern) {
                        [pscustomobject]@{
                            Version = [version]$Matches.version
                            Architecture = $Matches.arch
                            Url = $downloadUri.AbsoluteUri
                        }
                    }
                }
            )

            if (-not $installers) {
                throw 'No Everything 1.5 beta EXE installers found on the downloads page.'
            }

            # Page order is not a release guarantee. Compare numeric versions instead.
            $latestVersion = ($installers | Sort-Object Version -Descending | Select-Object -First 1).Version
            $x86 = $installers | Where-Object { $_.Version -eq $latestVersion -and $_.Architecture -eq 'x86' } | Select-Object -First 1
            $x64 = $installers | Where-Object { $_.Version -eq $latestVersion -and $_.Architecture -eq 'x64' } | Select-Object -First 1
            if (-not $x86 -or -not $x64) {
                throw "Everything 1.5 beta $latestVersion is missing a matching x86 or x64 EXE installer."
            }

            return @{
                Version = $latestVersion.ToString()
                URL32 = $x86.Url
                URL64 = $x64.Url
            }
        }
        catch {
            if ($attempt -eq 3) {
                throw "Unable to detect the latest Everything 1.5 beta after $attempt attempts: $($_.Exception.Message)"
            }
            Write-Warning "Everything download check failed (attempt $attempt/3): $($_.Exception.Message). Retrying..."
            Start-Sleep -Seconds (2 * $attempt)
        }
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
