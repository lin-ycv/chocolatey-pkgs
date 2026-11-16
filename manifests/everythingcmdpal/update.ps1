# ECP-only Chocolatey-AU updater; ECP_RELEASE_TAG pins a triggering GitHub release.
$ErrorActionPreference = 'Stop'
Import-Module Chocolatey-AU -ErrorAction Stop
function global:au_GetLatest {
    $headers = @{ 'User-Agent' = 'everythingcmdpal-updater'; Accept = 'application/vnd.github+json' }
    if ($env:GITHUB_TOKEN) { $headers['Authorization'] = "Bearer $env:GITHUB_TOKEN" }
    if ($env:ECP_RELEASE_TAG) {
        $tag = [uri]::EscapeDataString($env:ECP_RELEASE_TAG)
        $releases = @(Invoke-RestMethod -Uri "https://api.github.com/repos/lin-ycv/EverythingCommandPalette/releases/tags/$tag" -Headers $headers)
    } else {
        # Search past other-product-only releases to find this product's latest.
        $releases = @(Invoke-RestMethod -Uri 'https://api.github.com/repos/lin-ycv/EverythingCommandPalette/releases?per_page=100' -Headers $headers)
    }
    $pattern = '(?i)^VictorLin\.EverythingCP_(?<version>\d+\.\d+\.\d+\.\d+)_(?<arch>x64|arm64)__[^/]+\.msix$'
    foreach ($release in $releases) {
        if ($release.draft -or $release.prerelease) { continue }
        $assets = @($release.assets | Where-Object { $_.name -match $pattern })
        if ($assets.Count -eq 0) { continue }
        $x64 = @($assets | Where-Object { $_.name -match '_x64__' })
        $arm64 = @($assets | Where-Object { $_.name -match '_arm64__' })
        if ($x64.Count -ne 1 -or $arm64.Count -gt 1) { throw "Expected one ECP x64 and at most one ARM64 MSIX in $($release.tag_name)." }
        $version = [regex]::Match($x64[0].name, $pattern).Groups['version'].Value
        if ($arm64.Count -eq 1 -and ([regex]::Match($arm64[0].name, $pattern).Groups['version'].Value -ne $version)) {
            throw "Mismatched ECP package versions in $($release.tag_name)."
        }
        foreach ($asset in $assets) {
            if ($asset.digest -notmatch '^sha256:[a-fA-F0-9]{64}$') { throw "Missing SHA256 for $($asset.name)." }
        }
        $armUrl = ''
        $armHash = ''
        if ($arm64.Count -eq 1) {
            $armUrl = [string]$arm64[0].browser_download_url
            $armHash = ([string]$arm64[0].digest).Substring(7).ToLowerInvariant()
        }
        return @{
            Version = $version
            URL64 = [string]$x64[0].browser_download_url
            Checksum64 = ([string]$x64[0].digest).Substring(7).ToLowerInvariant()
            ARM64 = $armUrl
            Checksuma64 = $armHash
            ReleaseTag = [string]$release.tag_name
        }
    }
    if ($env:ECP_RELEASE_TAG) { return 'ignore' }
    throw 'No ECP MSIX release found in the last 100 releases.'
}
function global:au_SearchReplace {
    @{
        '.\tools\chocolateyinstall.ps1' = @{
            '(?i)(^\$url64\s*=\s*)''[^'']*''' = "`$1'$($Latest.URL64)'"
            '(?i)(^\$hash64\s*=\s*)''[^'']*''' = "`$1'$($Latest.Checksum64)'"
            '(?i)(^\$urlArm64\s*=\s*)''[^'']*''' = "`$1'$($Latest.ARM64)'"
            '(?i)(^\$hashArm64\s*=\s*)''[^'']*''' = "`$1'$($Latest.Checksuma64)'"
        }
        '.\everythingcmdpal.nuspec' = @{
            '(?i)(<releaseNotes>)[^<]*(</releaseNotes>)' = "`$1https://github.com/lin-ycv/EverythingCommandPalette/releases/tag/$($Latest.ReleaseTag)`$2"
        }
    }
}
update -ChecksumFor none
